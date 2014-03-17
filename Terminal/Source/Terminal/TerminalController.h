// コントローラダイアログ

#ifndef TERMINAL_CONTROLLER_H
#define TERMINAL_CONTROLLER_H

#include "../device/controller_struct.h"

#include <QTimer>
#include <QString>
#include <QGraphicsScene>
#include <QGraphicsLineItem>
#include <QGraphicsEllipseItem>
#include "ui_Controller.h"



class TerminalController : public QDialog{
Q_OBJECT

	/* 定数 */
private:
	



	/* メンバー */
private:
	Ui::ControllerClass m_ui;

	QPushButton *m_ButtonShow;
	
	QTimer *m_Timer;
	QGraphicsScene *m_Scene;
	QGraphicsEllipseItem *m_PadPoint;
	QGraphicsLineItem *m_PadCrossH, *m_PadCrossV;

	bool m_Checked;
	bool m_PadMoving;
	bool m_SliderMoving;
	double m_TargetVelX;
	double m_TargetVelY;
	Controller_t m_Controller;
	



	

public:
	// コンストラクタ
	TerminalController(QWidget *parent, QPushButton *show);
	
	// デストラクタ
	~TerminalController();

	// ダイアログが閉じられたときの処理
	void done(int r);

	
private:
	// イベントフィルター
	bool eventFilter(QObject *obj, QEvent *event);

	// パッドの操作点を再描画
	void redrawPad(void);

public slots:
	// 有効にする
	void enable(bool enable, bool idle = false, bool cont_w = false);

private slots:
	// 一定周期で呼び出される
	void onInterval(void);

	// 表示ボタンが押された
	void showToggled(bool state);

	// チェックボタンが押された
	void checked(int state);

	// ローテーションが設定された
	void rotationChanged(int value);

	// ローテーションが押された
	void rotationPressed(void);

	// ローテーションが放された
	void rotationReleased(void);

	// ドリブルパワーが設定された
	void dribbleChanged(int value);

	// キックパワーが設定された
	void kickChanged(int value);

	// ノーマルキックボタンが押された
	void normalPushed(void);

	// チップキックボタンが押された
	void chipPushed(void);








signals:
	// コントローラをセットする
	void setControllerState(ControllerState_t *state);

public slots:
	// コントローラを要求する
	void requestControllerState(void);




};

#endif // TERMINAL_CONTROLLER_H
