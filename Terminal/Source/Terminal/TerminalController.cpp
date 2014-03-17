// コントローラダイアログ

#include "TerminalController.h"
#include "trace.h"
#include "convqstr.h"

#include <QRectF>
#include <QPen>
#include <QBrush>
#include <QEvent>
#include <QMouseEvent>

#define _USE_MATH_DEFINES
#include <math.h>
#include <string>



/* 定数 */
static const int PERIOD = 30;

static const int PAD_POINT_RADIUS	= 4;
static const double PAD_DECLINE		= 0.5;
static const double PAD_CUTOFF		= 0.005;

static const int SLIDER_MAX			= 65536;
static const double SLIDER_DECLINE	= 0.5;
static const double SLIDER_CUTOFF	= 0.005;
static const double SLIDER_SCALE	= 2.0;



// コンストラクタ
TerminalController::TerminalController(QWidget *parent, QPushButton *show)
	: QDialog(parent), m_ButtonShow(show), m_Checked(false), m_PadMoving(false), m_SliderMoving(false),
	m_TargetVelX(0.0), m_TargetVelY(0.0)
{
	// 初期化
	memset(&m_Controller, 0x00, sizeof(Controller_t));

	// GUIを作成
	m_ui.setupUi(this);

	// イベントフィルターをインストール
	m_ui.Pad->viewport()->installEventFilter(this);
	
	// シグナルを接続
	connect(m_ButtonShow, SIGNAL(clicked(bool)), this, SLOT(showToggled(bool)));

	connect(m_ui.CheckUse, SIGNAL(stateChanged(int)), this, SLOT(checked(int)));
	
	connect(m_ui.SliderRotation, SIGNAL(valueChanged(int)), this, SLOT(rotationChanged(int)));
	connect(m_ui.SliderRotation, SIGNAL(sliderPressed()), this, SLOT(rotationPressed()));
	connect(m_ui.SliderRotation, SIGNAL(sliderReleased()), this, SLOT(rotationReleased()));
	connect(m_ui.SliderDribble, SIGNAL(valueChanged(int)), this, SLOT(dribbleChanged(int)));
	connect(m_ui.SliderKick, SIGNAL(valueChanged(int)), this, SLOT(kickChanged(int)));

	connect(m_ui.ButtonNormal, SIGNAL(clicked()), this, SLOT(normalPushed()));
	connect(m_ui.ButtonChip, SIGNAL(clicked()), this, SLOT(chipPushed()));
	
	// ラベルを更新させる
	m_ui.SliderDribble->setValue(1);
	m_ui.SliderDribble->setValue(0);
	m_ui.SliderKick->setValue(1);
	m_ui.SliderKick->setValue(0);

	m_ButtonShow->setEnabled(true);

	// パッドの描画用のシーンを作成
	m_Scene = new QGraphicsScene(this);
	m_ui.Pad->setScene(m_Scene);
	
	QPen pen(QBrush(QColor::fromRgb(255, 0, 0)), 2.0);
	QGraphicsEllipseItem *ellipse;
	m_PadPoint = m_Scene->addEllipse(0, 0, PAD_POINT_RADIUS * 2, PAD_POINT_RADIUS * 2, pen);
	m_PadCrossH = m_Scene->addLine(0, 0, 1, 0, QPen(Qt::black));
	m_PadCrossV = m_Scene->addLine(0, 0, 0, 1, QPen(Qt::black));
	m_PadPoint->setVisible(false);
	m_PadCrossH->setVisible(false);
	m_PadCrossV->setVisible(false);

	// タイマーを作成
	m_Timer = new QTimer(this);
    connect(m_Timer, SIGNAL(timeout()), this, SLOT(onInterval()));
	//m_Timer->start(PERIOD);
}

// デストラクタ
TerminalController::~TerminalController(){

	
}

// ダイアログが閉じられたときの処理
void TerminalController::done(int r){
	// 表示ボタンが押された状態を強制解除
	m_ButtonShow->blockSignals(true);
	m_ButtonShow->setChecked(false);
	m_ButtonShow->blockSignals(false);

	QDialog::done(r);

	m_ui.CheckUse->setChecked(false);
}

// コントローラを要求する
void TerminalController::requestControllerState(void){
	if (m_Controller.Enable == true){
		// ControllerStateに詰め直す
		double velx, vely, vel, dir, rot;
		int kick;
		velx = m_Controller.VelX;
		vely = m_Controller.VelY;
		vel = sqrt(velx * velx + vely * vely);
		if (PAD_CUTOFF < vel){
			dir = (0.0 <= vely) ? (acos(velx / vel) * 2.0 / M_PI) : (4.0 - acos(velx / vel) * 2.0 / M_PI);
		}else{
			vel = 0.0;
			dir = 0.0;
		}
		rot = -m_Controller.VelR;
		if (m_Controller.NormalKick == true){
			kick = m_Controller.KickPower;
		}else if (m_Controller.ChipKick == true){
			kick = -m_Controller.KickPower;
		}else{
			kick = 0;
		}
		m_Controller.NormalKick = false;
		m_Controller.ChipKick = false;

		// 倍率を適用
		double scale = (double)m_ui.SpinScale->value();
		vel *= scale;
		rot *= SLIDER_SCALE * scale;

		//Trace(L"move(%.3f,%.3f,%.3f)", vel, dir, rot);

		ControllerState_t *state = new ControllerState_t;
		state->Velocity		= vel * 256;
		state->Direction	= dir * 256;
		state->Rotation		= rot * 256;
		state->Dribble		= m_Controller.DribblePower;
		state->Kick			= kick;
		state->Enabled		= 1;

		// 送信
		emit setControllerState(state);
	}else{
		emit setControllerState(nullptr);
	}
}

// イベントフィルター
bool TerminalController::eventFilter(QObject *obj, QEvent *event){
	if (obj != m_ui.Pad->viewport()) return false;

	const QWidget *view = m_ui.Pad->viewport();

	if ((event->type() == QEvent::MouseMove) || (event->type() == QEvent::MouseButtonPress)){
		// マウスボタンを押した・押したまま動かした
		QMouseEvent *mouseEvent = (QMouseEvent*)event;
		if (mouseEvent->buttons() & Qt::LeftButton){
			double w, h, vel;
			w = view->width() / 2;
			h = view->height() / 2;
			m_TargetVelX = (double)(mouseEvent->x() - w) / (double)w;
			m_TargetVelY = (double)(h - mouseEvent->y()) / (double)h;
			vel = sqrt(m_TargetVelX * m_TargetVelX + m_TargetVelY * m_TargetVelY);
			if (1.0 < vel){
				m_TargetVelX /= vel;
				m_TargetVelY /= vel;
			}
			m_PadMoving = true;
			//Trace(L"move(%.3f,%.3f)", m_Controller.VelX, m_Controller.VelY);
		}
		return true;
	}else if (event->type() == QEvent::MouseButtonRelease){
		// マウスボタンを離した
		QMouseEvent *mouseEvent = (QMouseEvent*)event;
		if (mouseEvent->button() == Qt::LeftButton){
			m_TargetVelX = 0.0;
			m_TargetVelY = 0.0;
			m_PadMoving = false;
			//Trace(L"release(%.3f,%.3f)", m_Controller.VelX, m_Controller.VelY);
		}
		return true;
	}else if (event->type() == QEvent::Resize){
		// サイズが変わった
		int w = view->width();
		int h = view->height();
		m_Scene->setSceneRect(0, 0, view->width(), view->height());
		m_PadCrossH->setLine(0, h / 2, w, h / 2);
		m_PadCrossV->setLine(w / 2, 0, w / 2, h);
		redrawPad();
	}
	return false;
}

// パッドの操作点を再描画
void TerminalController::redrawPad(void){
	if (m_Checked == true){
		double w, h, x, y;
		w = m_Scene->width();
		h = m_Scene->height();
		x = (m_Controller.VelX + 1.0) * w / 2 - PAD_POINT_RADIUS;
		y = (1.0 - m_Controller.VelY) * h / 2 - PAD_POINT_RADIUS;
		m_PadPoint->setPos(x, y);
	}
}

// 有効にする
void TerminalController::enable(bool enable, bool idle, bool cont_w){
	bool en = enable & idle & cont_w;
	
	this->setEnabled(en);

	if (m_Checked != (m_Checked & en)){	
		m_ui.CheckUse->setChecked(m_Checked & en);
	}
}

// 一定周期で呼び出される
void TerminalController::onInterval(void){
	if (m_Checked == true){
		// 値を徐々に変化させる
		// 操作されていなかったら値を減衰させる
		
		double velx, vely;
		velx = m_Controller.VelX * PAD_DECLINE + m_TargetVelX * (1.0 - PAD_DECLINE);
		vely = m_Controller.VelY * PAD_DECLINE + m_TargetVelY * (1.0 - PAD_DECLINE);
		if (abs(velx) < PAD_CUTOFF) velx = 0.0;
		if (abs(vely) < PAD_CUTOFF) vely = 0.0;
		m_Controller.VelX = velx;
		m_Controller.VelY = vely;
		redrawPad();

		if (m_SliderMoving == false){
			double velr = m_Controller.VelR * SLIDER_DECLINE;
			if (abs(velr) <= SLIDER_CUTOFF) velr = 0.0;
			m_ui.SliderRotation->setValue(velr * 65536);
		}
	}else{
		m_Timer->stop();
	}
}

// 表示ボタンが押された
void TerminalController::showToggled(bool state){
	if (state == true){
		this->show();
	}else{
		this->hide();
		m_ui.CheckUse->setChecked(false);
	}
}

// チェックボタンが押された
void TerminalController::checked(int state){
	m_Checked = state != Qt::Unchecked;
	//Trace(L"Controller CheckeState:%d", state);

	m_Controller.Enable = m_Checked;
	if (m_Checked == true){
		requestControllerState();
		redrawPad();
		m_Timer->start(PERIOD);
	}else{
		m_Timer->stop();
	}
	m_PadPoint->setVisible(m_Checked);
	m_PadCrossH->setVisible(m_Checked);
	m_PadCrossV->setVisible(m_Checked);

	m_Controller.VelX = 0.0;
	m_Controller.VelY = 0.0;
	m_ui.SliderRotation->setValue(0);
	m_ui.SliderDribble->setValue(0);
	m_ui.SliderKick->setValue(0);
}

// ローテーションが設定された
void TerminalController::rotationChanged(int value){
	m_Controller.VelR = -(double)value / (double)SLIDER_MAX;
	//Trace(L"Controller Rotation:%f", m_Controller.VelR);
}

// ローテーションが押された
void TerminalController::rotationPressed(void){
	m_SliderMoving = true;
}

// ローテーションが放された
void TerminalController::rotationReleased(void){
	m_SliderMoving = false;
}

// ドリブルパワーが設定された
void TerminalController::dribbleChanged(int value){
	m_Controller.DribblePower = value;
	m_ui.LabelDribble->setText(QString::number(value));
	//Trace(L"Controller Dribble:%d", m_DribblePower);
}

// キックパワーが設定された
void TerminalController::kickChanged(int value){
	m_Controller.KickPower = value;
	m_ui.LabelKick->setText(QString::number(value));
	//Trace(L"Controller Kick:%d", m_KickPower);
}

// ノーマルキックボタンが押された
void TerminalController::normalPushed(void){
	m_Controller.NormalKick = true;
}

// チップキックボタンが押された
void TerminalController::chipPushed(void){
	m_Controller.ChipKick = true;
}