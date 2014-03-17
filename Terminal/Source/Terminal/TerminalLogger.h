// ログの表示と保存

#ifndef TERMINAL_LOGGER_H
#define TERMINAL_LOGGER_H

#include "../device/device.h"

#include <QObject>
#include <QLabel>
#include <QPushButton>
#include <QCheckBox>
#include <QGraphicsView>
#include <QTableWidget>
#include <QAction>

#include <map>




class TerminalLogger : public QObject{
Q_OBJECT
	
	/* 定数・型宣言 */
private:

	static const int MAX_INI_LENGTH = 64 * 1024;	// INIファイルの文字列の長さ

	/* システムで使用済みのID */
	enum ID_e{
		ID_ERROR= 0,			// 意味は無い
		ID_DELTATIME = 1,		// ms単位の相対時間
		ID_COPTIME = 2,			// ms単位のコプロセッサの絶対時間
		ID_DROP = 3,			// データの欠落の可能性を示す
		
		_ID_USER_ = 0x020,		// 以降、ユーザーが使用可能なID
		_ID_BYTE_MAX_ = 0x20,	// IDの最大数(1バイト型)
		_ID_MAX_ = 0x400,		// IDの最大数
	};

	// 型情報
	enum Type_e{
		TYPE_ERROR,		// エラー
		TYPE_BIT,		// ビット配列
		TYPE_INT,		// 1,2,4バイト整数
		TYPE_FIX,		// 1,2,4バイト固定小数点数
		TYPE_FLOAT,		// 4バイト浮動小数点数
		_NUM_OF_TYPES_
	};
	
	// 型文字列と数値の変換
	struct TypeTable_t{
		wchar_t *Name;
		Type_e Type;
		bool Signed;
	};
	static const TypeTable_t TYPE_TABLE[];

	// ログ登録情報
	struct Register_t{
		unsigned int ID;	// 登録ID
		bool Default;		// ディフォルトで登録
		wchar_t Name[32];	// 名前
		wchar_t Unit[16];	// 単位 (数値のときのみ有効)
		Type_e Type;		// 型
		double Num;			// 係数(分子) (数値のときのみ有効)
		//double Den;		// 係数(分母) (数値のときのみ有効)
		int Width;			// ビット幅 (ビット配列のときのみ有効)

		QTableWidgetItem *Item;	// 値を表示するアイテム
	};

	



private:
	/* メンバー */
	QCheckBox *m_CheckUse;
	QGraphicsView *m_Graph;
	QPushButton *m_Add;
	QPushButton *m_Remove;
	QTableWidget *m_List;
	QTableWidget *m_SaveList;
	QLabel *m_Label;
	QPushButton *m_Start;
	QPushButton *m_Stop;
	QPushButton *m_Save;

	QAction *m_SaveActionRecently;
	QAction *m_SaveActionCSV;
	QAction *m_SaveActionCSVplusPLT;
	QAction *m_SaveActionVCD;

	bool m_Enabled;
	//bool m_Checked;
	bool m_Logging;
	bool m_Dropped;

	std::map<unsigned int, Register_t> m_Register;	// IDの登録情報
	bool m_RegisterSigned[_ID_MAX_];				// 符号があるかどうか

	unsigned int m_ReceivingID;
	unsigned int m_ReceivingData;
	unsigned int m_ReceivingSize;
	unsigned int m_ReceivingRemain;
	union Compound_u{
		unsigned long Unsigned;
		signed long Signed;
		float Float;
	} m_CurrentValues[_ID_MAX_];		// 現在の値
	int m_CurrentValuesSize[_ID_MAX_];	// 現在の値のサイズ
	int m_CurrentTime;					// 現在の時刻

	struct Point_t{
		unsigned int Time;				// ロギング開始時からの経過時間
		unsigned int ID;				// ID
		Compound_u Value;				// 値
		unsigned int Size;				// 値のサイズ
	};
	std::vector<Point_t> m_LoggingPoints;	// ログ
	std::vector<unsigned int> m_LoggingIDs;	// ログを取っているIDのリスト

	std::wstring m_RecentlySavePath;	// 最近使用した保存先のパス
	QAction *m_RecentlySaveAction;		// 最近使用した保存設定



public:
	// コンストラクタ
	TerminalLogger(QCheckBox *check, QGraphicsView *graph, QPushButton *add, QPushButton *remove, QTableWidget *list, QTableWidget *save_list, QLabel *label, QPushButton *start, QPushButton *stop, QPushButton *save);
	
	// デストラクタ
	~TerminalLogger();


private:
	// ログ情報を追加
	void AddLogInfo(unsigned int id, wchar_t *str);

	// ログ情報を移動
	void MoveLogInfo(QTableWidget *dst_table, QTableWidget *src_table, bool dir_add);

	// ロギングする項目を更新する
	void UpdateLoggingList(void);

	// 値を文字列に変換
	const char* CreateString(const Register_t *reg, Compound_u value, int size);

	// ログを時刻でソート
	void SortLog(void);


private slots:
	// チェックボタンが押された
	//void checked(int state);

	// →ボタンが押された
	void addPushed(void){
		MoveLogInfo(m_SaveList, m_List, true);
	}

	// ←ボタンが押された
	void removePushed(void){
		MoveLogInfo(m_List, m_SaveList, false);
	}

	// 開始ボタンが押された
	void startPushed(void);

	// 停止ボタンが押された
	void stopPushed(void);

	// 保存ボタンが押された
	void savePushed(QAction *);




public slots:
	// 有効にする
	void enable(bool enabled, bool idle = false, bool pipe_r = false);

	// ログの表示を更新する
	void update(void);

	// ログ情報をクリア
	void clearLogInfo(void);

	// ログ情報を与える
	void setLogInfo(const std::wstring &name);

	// ログを受信する
	void receiveLog(unsigned short *data, unsigned int size);

	// エラーを受信する
	void receiveError(void);


signals:
	// ロギングする項目を送信
	// listがNULLでなかったらロギングする
	void sendLoggingList(char *list, unsigned int size);

	



private:
	// CSVファイルに保存
	bool SaveToCSV(const std::wstring &path_no_ext);

	// PLTファイルに保存
	bool SaveToPLT(const std::wstring &path_no_ext);

	// VCDファイルに保存
	bool SaveToVCD(const std::wstring &path_no_ext);


};

#endif // TERMINAL_LOGGER_H
