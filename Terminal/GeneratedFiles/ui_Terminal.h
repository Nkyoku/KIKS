/********************************************************************************
** Form generated from reading UI file 'Terminal.ui'
**
** Created by: Qt User Interface Compiler version 5.1.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TERMINAL_H
#define UI_TERMINAL_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QFrame>
#include <QtWidgets/QGraphicsView>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPlainTextEdit>
#include <QtWidgets/QProgressBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QScrollArea>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSplitter>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QToolBox>
#include <QtWidgets/QTreeWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_TerminalClass
{
public:
    QWidget *centralWidget;
    QHBoxLayout *horizontalLayout;
    QSplitter *splitter;
    QTabWidget *Tab;
    QWidget *TabInfo;
    QVBoxLayout *verticalLayout_3;
    QScrollArea *scrollArea;
    QWidget *scrollAreaWidgetContents;
    QVBoxLayout *verticalLayout_2;
    QFrame *frame_2;
    QHBoxLayout *horizontalLayout_8;
    QGraphicsView *InfoIconDevice;
    QGridLayout *gridLayout;
    QPushButton *InfoButtonReboot;
    QPushButton *InfoButtonDisconnect;
    QPushButton *InfoButtonConnect;
    QPushButton *ControllerShow;
    QLabel *InfoLabelName;
    QLabel *InfoLabelVersion;
    QGroupBox *ProcessorGroup;
    QVBoxLayout *verticalLayout_8;
    QLabel *label_11;
    QHBoxLayout *horizontalLayout_9;
    QLineEdit *ProcessorInput;
    QPushButton *ProcessorOpen;
    QHBoxLayout *horizontalLayout_13;
    QPushButton *ProcessorWrite;
    QSpacerItem *horizontalSpacer;
    QPushButton *ProcessorRead;
    QSpacerItem *horizontalSpacer_9;
    QGroupBox *BitstreamGroup;
    QVBoxLayout *verticalLayout_7;
    QLabel *label_10;
    QHBoxLayout *horizontalLayout_11;
    QLineEdit *BitstreamInput;
    QPushButton *BitstreamOpen;
    QHBoxLayout *horizontalLayout_14;
    QPushButton *BitstreamSend;
    QSpacerItem *horizontalSpacer_7;
    QPushButton *BitstreamWrite;
    QSpacerItem *horizontalSpacer_8;
    QGroupBox *CoprocessorGroup;
    QVBoxLayout *verticalLayout_12;
    QLabel *label_14;
    QHBoxLayout *horizontalLayout_12;
    QLineEdit *CoprocessorInput;
    QPushButton *CoprocessorOpen;
    QHBoxLayout *horizontalLayout_15;
    QPushButton *CoprocessorSend;
    QSpacerItem *horizontalSpacer_10;
    QPushButton *CoprocessorWrite;
    QSpacerItem *horizontalSpacer_18;
    QSpacerItem *verticalSpacer;
    QWidget *TabFiler;
    QVBoxLayout *verticalLayout_4;
    QToolBox *FilerToolBox;
    QWidget *page;
    QVBoxLayout *verticalLayout_5;
    QTableWidget *PipeTable;
    QWidget *page_2;
    QVBoxLayout *verticalLayout_6;
    QTreeWidget *FileTree;
    QProgressBar *FileProgress;
    QWidget *TabLogger;
    QVBoxLayout *verticalLayout_11;
    QScrollArea *scrollArea_3;
    QWidget *scrollAreaWidgetContents_3;
    QVBoxLayout *verticalLayout_14;
    QHBoxLayout *horizontalLayout_6;
    QCheckBox *LoggerCheckUse;
    QGraphicsView *LoggerGraph;
    QHBoxLayout *horizontalLayout_5;
    QVBoxLayout *verticalLayout_13;
    QLabel *label_4;
    QTableWidget *LoggerList;
    QVBoxLayout *verticalLayout_10;
    QPushButton *LoggerButtonAdd;
    QPushButton *LoggerButtonRemove;
    QVBoxLayout *verticalLayout_9;
    QLabel *label_5;
    QTableWidget *LoggerSaveList;
    QLabel *LoggerLabel;
    QHBoxLayout *horizontalLayout_2;
    QPushButton *LoggerStart;
    QPushButton *LoggerStop;
    QPushButton *LoggerSave;
    QWidget *TabSetting;
    QFrame *frame;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_3;
    QLabel *label;
    QPushButton *ConsoleClear;
    QPlainTextEdit *ConsoleOutput;
    QHBoxLayout *horizontalLayout_4;
    QLabel *label_2;
    QLineEdit *ConsoleInput;
    QStatusBar *StatusBar;

    void setupUi(QMainWindow *TerminalClass)
    {
        if (TerminalClass->objectName().isEmpty())
            TerminalClass->setObjectName(QStringLiteral("TerminalClass"));
        TerminalClass->setEnabled(true);
        TerminalClass->resize(730, 558);
        centralWidget = new QWidget(TerminalClass);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(centralWidget->sizePolicy().hasHeightForWidth());
        centralWidget->setSizePolicy(sizePolicy);
        centralWidget->setMinimumSize(QSize(640, 480));
        horizontalLayout = new QHBoxLayout(centralWidget);
        horizontalLayout->setSpacing(4);
        horizontalLayout->setContentsMargins(11, 11, 11, 11);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalLayout->setContentsMargins(4, 4, 4, 4);
        splitter = new QSplitter(centralWidget);
        splitter->setObjectName(QStringLiteral("splitter"));
        splitter->setOrientation(Qt::Horizontal);
        splitter->setHandleWidth(4);
        Tab = new QTabWidget(splitter);
        Tab->setObjectName(QStringLiteral("Tab"));
        Tab->setEnabled(true);
        QSizePolicy sizePolicy1(QSizePolicy::Expanding, QSizePolicy::Minimum);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(Tab->sizePolicy().hasHeightForWidth());
        Tab->setSizePolicy(sizePolicy1);
        Tab->setMinimumSize(QSize(400, 320));
        Tab->setStyleSheet(QStringLiteral(""));
        TabInfo = new QWidget();
        TabInfo->setObjectName(QStringLiteral("TabInfo"));
        verticalLayout_3 = new QVBoxLayout(TabInfo);
        verticalLayout_3->setSpacing(0);
        verticalLayout_3->setContentsMargins(11, 11, 11, 11);
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        verticalLayout_3->setContentsMargins(0, 0, 0, 0);
        scrollArea = new QScrollArea(TabInfo);
        scrollArea->setObjectName(QStringLiteral("scrollArea"));
        scrollArea->setFrameShape(QFrame::NoFrame);
        scrollArea->setWidgetResizable(true);
        scrollAreaWidgetContents = new QWidget();
        scrollAreaWidgetContents->setObjectName(QStringLiteral("scrollAreaWidgetContents"));
        scrollAreaWidgetContents->setGeometry(QRect(0, 0, 441, 507));
        verticalLayout_2 = new QVBoxLayout(scrollAreaWidgetContents);
        verticalLayout_2->setSpacing(16);
        verticalLayout_2->setContentsMargins(11, 11, 11, 11);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        verticalLayout_2->setContentsMargins(16, 16, 16, 16);
        frame_2 = new QFrame(scrollAreaWidgetContents);
        frame_2->setObjectName(QStringLiteral("frame_2"));
        frame_2->setEnabled(true);
        sizePolicy1.setHeightForWidth(frame_2->sizePolicy().hasHeightForWidth());
        frame_2->setSizePolicy(sizePolicy1);
        frame_2->setFrameShape(QFrame::Box);
        horizontalLayout_8 = new QHBoxLayout(frame_2);
        horizontalLayout_8->setSpacing(4);
        horizontalLayout_8->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_8->setObjectName(QStringLiteral("horizontalLayout_8"));
        horizontalLayout_8->setContentsMargins(8, 8, 8, 8);
        InfoIconDevice = new QGraphicsView(frame_2);
        InfoIconDevice->setObjectName(QStringLiteral("InfoIconDevice"));
        QSizePolicy sizePolicy2(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(InfoIconDevice->sizePolicy().hasHeightForWidth());
        InfoIconDevice->setSizePolicy(sizePolicy2);
        InfoIconDevice->setMinimumSize(QSize(64, 64));
        InfoIconDevice->setMaximumSize(QSize(64, 64));
        InfoIconDevice->setBaseSize(QSize(64, 64));
        InfoIconDevice->setAcceptDrops(false);
        InfoIconDevice->setStyleSheet(QStringLiteral("background-color:transparent;"));
        InfoIconDevice->setFrameShape(QFrame::NoFrame);
        InfoIconDevice->setFrameShadow(QFrame::Plain);
        InfoIconDevice->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
        InfoIconDevice->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
        InfoIconDevice->setInteractive(false);
        InfoIconDevice->setSceneRect(QRectF(0, 0, 64, 64));
        InfoIconDevice->setRenderHints(QPainter::Antialiasing|QPainter::TextAntialiasing);

        horizontalLayout_8->addWidget(InfoIconDevice);

        gridLayout = new QGridLayout();
        gridLayout->setSpacing(6);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        InfoButtonReboot = new QPushButton(frame_2);
        InfoButtonReboot->setObjectName(QStringLiteral("InfoButtonReboot"));
        InfoButtonReboot->setEnabled(true);
        sizePolicy2.setHeightForWidth(InfoButtonReboot->sizePolicy().hasHeightForWidth());
        InfoButtonReboot->setSizePolicy(sizePolicy2);
        InfoButtonReboot->setMinimumSize(QSize(64, 28));
        InfoButtonReboot->setMaximumSize(QSize(64, 28));
        InfoButtonReboot->setBaseSize(QSize(64, 28));

        gridLayout->addWidget(InfoButtonReboot, 1, 2, 1, 1);

        InfoButtonDisconnect = new QPushButton(frame_2);
        InfoButtonDisconnect->setObjectName(QStringLiteral("InfoButtonDisconnect"));
        InfoButtonDisconnect->setEnabled(true);
        sizePolicy2.setHeightForWidth(InfoButtonDisconnect->sizePolicy().hasHeightForWidth());
        InfoButtonDisconnect->setSizePolicy(sizePolicy2);
        InfoButtonDisconnect->setMinimumSize(QSize(64, 28));
        InfoButtonDisconnect->setMaximumSize(QSize(64, 28));
        InfoButtonDisconnect->setBaseSize(QSize(64, 28));

        gridLayout->addWidget(InfoButtonDisconnect, 1, 3, 1, 1);

        InfoButtonConnect = new QPushButton(frame_2);
        InfoButtonConnect->setObjectName(QStringLiteral("InfoButtonConnect"));
        InfoButtonConnect->setEnabled(true);
        sizePolicy2.setHeightForWidth(InfoButtonConnect->sizePolicy().hasHeightForWidth());
        InfoButtonConnect->setSizePolicy(sizePolicy2);
        InfoButtonConnect->setMinimumSize(QSize(64, 28));
        InfoButtonConnect->setMaximumSize(QSize(64, 28));
        InfoButtonConnect->setBaseSize(QSize(64, 28));

        gridLayout->addWidget(InfoButtonConnect, 0, 3, 1, 1);

        ControllerShow = new QPushButton(frame_2);
        ControllerShow->setObjectName(QStringLiteral("ControllerShow"));
        sizePolicy2.setHeightForWidth(ControllerShow->sizePolicy().hasHeightForWidth());
        ControllerShow->setSizePolicy(sizePolicy2);
        ControllerShow->setMinimumSize(QSize(64, 28));
        ControllerShow->setMaximumSize(QSize(64, 28));
        ControllerShow->setCheckable(true);
        ControllerShow->setFlat(false);

        gridLayout->addWidget(ControllerShow, 0, 2, 1, 1);

        InfoLabelName = new QLabel(frame_2);
        InfoLabelName->setObjectName(QStringLiteral("InfoLabelName"));
        InfoLabelName->setMinimumSize(QSize(0, 28));
        InfoLabelName->setMaximumSize(QSize(16777215, 28));
        InfoLabelName->setBaseSize(QSize(0, 28));
        InfoLabelName->setWordWrap(true);

        gridLayout->addWidget(InfoLabelName, 0, 0, 1, 2);

        InfoLabelVersion = new QLabel(frame_2);
        InfoLabelVersion->setObjectName(QStringLiteral("InfoLabelVersion"));
        InfoLabelVersion->setMinimumSize(QSize(0, 28));
        InfoLabelVersion->setMaximumSize(QSize(16777215, 28));
        InfoLabelVersion->setBaseSize(QSize(0, 28));
        InfoLabelVersion->setScaledContents(true);
        InfoLabelVersion->setWordWrap(true);

        gridLayout->addWidget(InfoLabelVersion, 1, 0, 1, 2);


        horizontalLayout_8->addLayout(gridLayout);


        verticalLayout_2->addWidget(frame_2);

        ProcessorGroup = new QGroupBox(scrollAreaWidgetContents);
        ProcessorGroup->setObjectName(QStringLiteral("ProcessorGroup"));
        ProcessorGroup->setEnabled(true);
        sizePolicy1.setHeightForWidth(ProcessorGroup->sizePolicy().hasHeightForWidth());
        ProcessorGroup->setSizePolicy(sizePolicy1);
        verticalLayout_8 = new QVBoxLayout(ProcessorGroup);
        verticalLayout_8->setSpacing(4);
        verticalLayout_8->setContentsMargins(11, 11, 11, 11);
        verticalLayout_8->setObjectName(QStringLiteral("verticalLayout_8"));
        verticalLayout_8->setContentsMargins(8, 8, 8, 8);
        label_11 = new QLabel(ProcessorGroup);
        label_11->setObjectName(QStringLiteral("label_11"));
        sizePolicy2.setHeightForWidth(label_11->sizePolicy().hasHeightForWidth());
        label_11->setSizePolicy(sizePolicy2);
        label_11->setMargin(0);
        label_11->setIndent(-1);

        verticalLayout_8->addWidget(label_11);

        horizontalLayout_9 = new QHBoxLayout();
        horizontalLayout_9->setSpacing(4);
        horizontalLayout_9->setObjectName(QStringLiteral("horizontalLayout_9"));
        ProcessorInput = new QLineEdit(ProcessorGroup);
        ProcessorInput->setObjectName(QStringLiteral("ProcessorInput"));
        QSizePolicy sizePolicy3(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(0);
        sizePolicy3.setHeightForWidth(ProcessorInput->sizePolicy().hasHeightForWidth());
        ProcessorInput->setSizePolicy(sizePolicy3);
        ProcessorInput->setMinimumSize(QSize(0, 20));
        ProcessorInput->setMaximumSize(QSize(16777215, 20));
        ProcessorInput->setBaseSize(QSize(0, 20));

        horizontalLayout_9->addWidget(ProcessorInput);

        ProcessorOpen = new QPushButton(ProcessorGroup);
        ProcessorOpen->setObjectName(QStringLiteral("ProcessorOpen"));
        sizePolicy2.setHeightForWidth(ProcessorOpen->sizePolicy().hasHeightForWidth());
        ProcessorOpen->setSizePolicy(sizePolicy2);
        ProcessorOpen->setMinimumSize(QSize(32, 20));
        ProcessorOpen->setMaximumSize(QSize(32, 20));
        ProcessorOpen->setBaseSize(QSize(32, 20));

        horizontalLayout_9->addWidget(ProcessorOpen);


        verticalLayout_8->addLayout(horizontalLayout_9);

        horizontalLayout_13 = new QHBoxLayout();
        horizontalLayout_13->setSpacing(4);
        horizontalLayout_13->setObjectName(QStringLiteral("horizontalLayout_13"));
        ProcessorWrite = new QPushButton(ProcessorGroup);
        ProcessorWrite->setObjectName(QStringLiteral("ProcessorWrite"));
        sizePolicy2.setHeightForWidth(ProcessorWrite->sizePolicy().hasHeightForWidth());
        ProcessorWrite->setSizePolicy(sizePolicy2);
        ProcessorWrite->setMinimumSize(QSize(64, 24));
        ProcessorWrite->setMaximumSize(QSize(64, 24));
        ProcessorWrite->setBaseSize(QSize(64, 24));

        horizontalLayout_13->addWidget(ProcessorWrite);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_13->addItem(horizontalSpacer);

        ProcessorRead = new QPushButton(ProcessorGroup);
        ProcessorRead->setObjectName(QStringLiteral("ProcessorRead"));
        sizePolicy2.setHeightForWidth(ProcessorRead->sizePolicy().hasHeightForWidth());
        ProcessorRead->setSizePolicy(sizePolicy2);
        ProcessorRead->setMinimumSize(QSize(64, 24));
        ProcessorRead->setMaximumSize(QSize(64, 24));
        ProcessorRead->setBaseSize(QSize(64, 24));

        horizontalLayout_13->addWidget(ProcessorRead);

        horizontalSpacer_9 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_13->addItem(horizontalSpacer_9);


        verticalLayout_8->addLayout(horizontalLayout_13);


        verticalLayout_2->addWidget(ProcessorGroup);

        BitstreamGroup = new QGroupBox(scrollAreaWidgetContents);
        BitstreamGroup->setObjectName(QStringLiteral("BitstreamGroup"));
        BitstreamGroup->setEnabled(true);
        sizePolicy1.setHeightForWidth(BitstreamGroup->sizePolicy().hasHeightForWidth());
        BitstreamGroup->setSizePolicy(sizePolicy1);
        verticalLayout_7 = new QVBoxLayout(BitstreamGroup);
        verticalLayout_7->setSpacing(4);
        verticalLayout_7->setContentsMargins(11, 11, 11, 11);
        verticalLayout_7->setObjectName(QStringLiteral("verticalLayout_7"));
        verticalLayout_7->setContentsMargins(8, 8, 8, 8);
        label_10 = new QLabel(BitstreamGroup);
        label_10->setObjectName(QStringLiteral("label_10"));
        sizePolicy2.setHeightForWidth(label_10->sizePolicy().hasHeightForWidth());
        label_10->setSizePolicy(sizePolicy2);
        label_10->setMargin(0);
        label_10->setIndent(-1);

        verticalLayout_7->addWidget(label_10);

        horizontalLayout_11 = new QHBoxLayout();
        horizontalLayout_11->setSpacing(4);
        horizontalLayout_11->setObjectName(QStringLiteral("horizontalLayout_11"));
        BitstreamInput = new QLineEdit(BitstreamGroup);
        BitstreamInput->setObjectName(QStringLiteral("BitstreamInput"));
        sizePolicy3.setHeightForWidth(BitstreamInput->sizePolicy().hasHeightForWidth());
        BitstreamInput->setSizePolicy(sizePolicy3);
        BitstreamInput->setMinimumSize(QSize(0, 20));
        BitstreamInput->setMaximumSize(QSize(16777215, 20));
        BitstreamInput->setBaseSize(QSize(0, 20));

        horizontalLayout_11->addWidget(BitstreamInput);

        BitstreamOpen = new QPushButton(BitstreamGroup);
        BitstreamOpen->setObjectName(QStringLiteral("BitstreamOpen"));
        sizePolicy2.setHeightForWidth(BitstreamOpen->sizePolicy().hasHeightForWidth());
        BitstreamOpen->setSizePolicy(sizePolicy2);
        BitstreamOpen->setMinimumSize(QSize(32, 20));
        BitstreamOpen->setMaximumSize(QSize(32, 20));
        BitstreamOpen->setBaseSize(QSize(32, 20));

        horizontalLayout_11->addWidget(BitstreamOpen);


        verticalLayout_7->addLayout(horizontalLayout_11);

        horizontalLayout_14 = new QHBoxLayout();
        horizontalLayout_14->setSpacing(4);
        horizontalLayout_14->setObjectName(QStringLiteral("horizontalLayout_14"));
        BitstreamSend = new QPushButton(BitstreamGroup);
        BitstreamSend->setObjectName(QStringLiteral("BitstreamSend"));
        sizePolicy2.setHeightForWidth(BitstreamSend->sizePolicy().hasHeightForWidth());
        BitstreamSend->setSizePolicy(sizePolicy2);
        BitstreamSend->setMinimumSize(QSize(64, 24));
        BitstreamSend->setMaximumSize(QSize(64, 24));
        BitstreamSend->setBaseSize(QSize(64, 24));

        horizontalLayout_14->addWidget(BitstreamSend);

        horizontalSpacer_7 = new QSpacerItem(40, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_14->addItem(horizontalSpacer_7);

        BitstreamWrite = new QPushButton(BitstreamGroup);
        BitstreamWrite->setObjectName(QStringLiteral("BitstreamWrite"));
        sizePolicy2.setHeightForWidth(BitstreamWrite->sizePolicy().hasHeightForWidth());
        BitstreamWrite->setSizePolicy(sizePolicy2);
        BitstreamWrite->setMinimumSize(QSize(64, 24));
        BitstreamWrite->setMaximumSize(QSize(64, 24));
        BitstreamWrite->setBaseSize(QSize(64, 24));

        horizontalLayout_14->addWidget(BitstreamWrite);

        horizontalSpacer_8 = new QSpacerItem(234, 14, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_14->addItem(horizontalSpacer_8);


        verticalLayout_7->addLayout(horizontalLayout_14);


        verticalLayout_2->addWidget(BitstreamGroup);

        CoprocessorGroup = new QGroupBox(scrollAreaWidgetContents);
        CoprocessorGroup->setObjectName(QStringLiteral("CoprocessorGroup"));
        CoprocessorGroup->setEnabled(true);
        sizePolicy1.setHeightForWidth(CoprocessorGroup->sizePolicy().hasHeightForWidth());
        CoprocessorGroup->setSizePolicy(sizePolicy1);
        verticalLayout_12 = new QVBoxLayout(CoprocessorGroup);
        verticalLayout_12->setSpacing(4);
        verticalLayout_12->setContentsMargins(11, 11, 11, 11);
        verticalLayout_12->setObjectName(QStringLiteral("verticalLayout_12"));
        verticalLayout_12->setContentsMargins(8, 8, 8, 8);
        label_14 = new QLabel(CoprocessorGroup);
        label_14->setObjectName(QStringLiteral("label_14"));
        sizePolicy2.setHeightForWidth(label_14->sizePolicy().hasHeightForWidth());
        label_14->setSizePolicy(sizePolicy2);
        label_14->setMargin(0);
        label_14->setIndent(-1);

        verticalLayout_12->addWidget(label_14);

        horizontalLayout_12 = new QHBoxLayout();
        horizontalLayout_12->setSpacing(4);
        horizontalLayout_12->setObjectName(QStringLiteral("horizontalLayout_12"));
        CoprocessorInput = new QLineEdit(CoprocessorGroup);
        CoprocessorInput->setObjectName(QStringLiteral("CoprocessorInput"));
        sizePolicy3.setHeightForWidth(CoprocessorInput->sizePolicy().hasHeightForWidth());
        CoprocessorInput->setSizePolicy(sizePolicy3);
        CoprocessorInput->setMinimumSize(QSize(0, 20));
        CoprocessorInput->setMaximumSize(QSize(16777215, 20));
        CoprocessorInput->setBaseSize(QSize(0, 20));

        horizontalLayout_12->addWidget(CoprocessorInput);

        CoprocessorOpen = new QPushButton(CoprocessorGroup);
        CoprocessorOpen->setObjectName(QStringLiteral("CoprocessorOpen"));
        sizePolicy2.setHeightForWidth(CoprocessorOpen->sizePolicy().hasHeightForWidth());
        CoprocessorOpen->setSizePolicy(sizePolicy2);
        CoprocessorOpen->setMinimumSize(QSize(32, 20));
        CoprocessorOpen->setMaximumSize(QSize(32, 20));
        CoprocessorOpen->setBaseSize(QSize(32, 20));

        horizontalLayout_12->addWidget(CoprocessorOpen);


        verticalLayout_12->addLayout(horizontalLayout_12);

        horizontalLayout_15 = new QHBoxLayout();
        horizontalLayout_15->setSpacing(4);
        horizontalLayout_15->setObjectName(QStringLiteral("horizontalLayout_15"));
        CoprocessorSend = new QPushButton(CoprocessorGroup);
        CoprocessorSend->setObjectName(QStringLiteral("CoprocessorSend"));
        sizePolicy2.setHeightForWidth(CoprocessorSend->sizePolicy().hasHeightForWidth());
        CoprocessorSend->setSizePolicy(sizePolicy2);
        CoprocessorSend->setMinimumSize(QSize(64, 24));
        CoprocessorSend->setMaximumSize(QSize(64, 24));
        CoprocessorSend->setBaseSize(QSize(64, 24));

        horizontalLayout_15->addWidget(CoprocessorSend);

        horizontalSpacer_10 = new QSpacerItem(40, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_15->addItem(horizontalSpacer_10);

        CoprocessorWrite = new QPushButton(CoprocessorGroup);
        CoprocessorWrite->setObjectName(QStringLiteral("CoprocessorWrite"));
        sizePolicy2.setHeightForWidth(CoprocessorWrite->sizePolicy().hasHeightForWidth());
        CoprocessorWrite->setSizePolicy(sizePolicy2);
        CoprocessorWrite->setMinimumSize(QSize(64, 24));
        CoprocessorWrite->setMaximumSize(QSize(64, 24));
        CoprocessorWrite->setBaseSize(QSize(64, 24));

        horizontalLayout_15->addWidget(CoprocessorWrite);

        horizontalSpacer_18 = new QSpacerItem(234, 14, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_15->addItem(horizontalSpacer_18);


        verticalLayout_12->addLayout(horizontalLayout_15);


        verticalLayout_2->addWidget(CoprocessorGroup);

        verticalSpacer = new QSpacerItem(20, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(verticalSpacer);

        scrollArea->setWidget(scrollAreaWidgetContents);

        verticalLayout_3->addWidget(scrollArea);

        Tab->addTab(TabInfo, QString());
        TabFiler = new QWidget();
        TabFiler->setObjectName(QStringLiteral("TabFiler"));
        verticalLayout_4 = new QVBoxLayout(TabFiler);
        verticalLayout_4->setSpacing(0);
        verticalLayout_4->setContentsMargins(11, 11, 11, 11);
        verticalLayout_4->setObjectName(QStringLiteral("verticalLayout_4"));
        verticalLayout_4->setContentsMargins(0, 0, 0, 0);
        FilerToolBox = new QToolBox(TabFiler);
        FilerToolBox->setObjectName(QStringLiteral("FilerToolBox"));
        page = new QWidget();
        page->setObjectName(QStringLiteral("page"));
        page->setGeometry(QRect(0, 0, 87, 87));
        verticalLayout_5 = new QVBoxLayout(page);
        verticalLayout_5->setSpacing(8);
        verticalLayout_5->setContentsMargins(11, 11, 11, 11);
        verticalLayout_5->setObjectName(QStringLiteral("verticalLayout_5"));
        verticalLayout_5->setContentsMargins(8, 8, 8, 8);
        PipeTable = new QTableWidget(page);
        PipeTable->setObjectName(QStringLiteral("PipeTable"));
        PipeTable->setEditTriggers(QAbstractItemView::NoEditTriggers);
        PipeTable->setSelectionMode(QAbstractItemView::NoSelection);
        PipeTable->setSelectionBehavior(QAbstractItemView::SelectItems);
        PipeTable->setVerticalScrollMode(QAbstractItemView::ScrollPerPixel);
        PipeTable->setHorizontalScrollMode(QAbstractItemView::ScrollPerPixel);
        PipeTable->setShowGrid(false);
        PipeTable->setSortingEnabled(true);
        PipeTable->setColumnCount(0);
        PipeTable->horizontalHeader()->setStretchLastSection(true);
        PipeTable->verticalHeader()->setVisible(false);

        verticalLayout_5->addWidget(PipeTable);

        FilerToolBox->addItem(page, QString::fromUtf8("\343\203\221\343\202\244\343\203\227"));
        page_2 = new QWidget();
        page_2->setObjectName(QStringLiteral("page_2"));
        page_2->setGeometry(QRect(0, 0, 441, 467));
        verticalLayout_6 = new QVBoxLayout(page_2);
        verticalLayout_6->setSpacing(4);
        verticalLayout_6->setContentsMargins(11, 11, 11, 11);
        verticalLayout_6->setObjectName(QStringLiteral("verticalLayout_6"));
        verticalLayout_6->setContentsMargins(8, 8, 8, 8);
        FileTree = new QTreeWidget(page_2);
        QTreeWidgetItem *__qtreewidgetitem = new QTreeWidgetItem();
        __qtreewidgetitem->setText(3, QStringLiteral("4"));
        __qtreewidgetitem->setText(2, QStringLiteral("3"));
        __qtreewidgetitem->setText(1, QStringLiteral("2"));
        __qtreewidgetitem->setText(0, QStringLiteral("1"));
        FileTree->setHeaderItem(__qtreewidgetitem);
        FileTree->setObjectName(QStringLiteral("FileTree"));
        FileTree->setContextMenuPolicy(Qt::CustomContextMenu);
        FileTree->setEditTriggers(QAbstractItemView::NoEditTriggers);
        FileTree->setProperty("showDropIndicator", QVariant(false));
        FileTree->setSelectionBehavior(QAbstractItemView::SelectRows);
        FileTree->setVerticalScrollMode(QAbstractItemView::ScrollPerPixel);
        FileTree->setIndentation(10);
        FileTree->setRootIsDecorated(true);
        FileTree->setUniformRowHeights(true);
        FileTree->setSortingEnabled(true);
        FileTree->setColumnCount(4);

        verticalLayout_6->addWidget(FileTree);

        FileProgress = new QProgressBar(page_2);
        FileProgress->setObjectName(QStringLiteral("FileProgress"));
        FileProgress->setMinimum(0);
        FileProgress->setMaximum(0);
        FileProgress->setValue(0);
        FileProgress->setAlignment(Qt::AlignCenter);
        FileProgress->setTextVisible(true);

        verticalLayout_6->addWidget(FileProgress);

        FilerToolBox->addItem(page_2, QString::fromUtf8("\343\203\225\343\202\241\343\202\244\343\203\253\343\202\267\343\202\271\343\203\206\343\203\240"));

        verticalLayout_4->addWidget(FilerToolBox);

        Tab->addTab(TabFiler, QString());
        TabLogger = new QWidget();
        TabLogger->setObjectName(QStringLiteral("TabLogger"));
        verticalLayout_11 = new QVBoxLayout(TabLogger);
        verticalLayout_11->setSpacing(0);
        verticalLayout_11->setContentsMargins(11, 11, 11, 11);
        verticalLayout_11->setObjectName(QStringLiteral("verticalLayout_11"));
        verticalLayout_11->setContentsMargins(0, 0, 0, 0);
        scrollArea_3 = new QScrollArea(TabLogger);
        scrollArea_3->setObjectName(QStringLiteral("scrollArea_3"));
        scrollArea_3->setFrameShape(QFrame::NoFrame);
        scrollArea_3->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
        scrollArea_3->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
        scrollArea_3->setWidgetResizable(true);
        scrollAreaWidgetContents_3 = new QWidget();
        scrollAreaWidgetContents_3->setObjectName(QStringLiteral("scrollAreaWidgetContents_3"));
        scrollAreaWidgetContents_3->setGeometry(QRect(0, 0, 441, 507));
        verticalLayout_14 = new QVBoxLayout(scrollAreaWidgetContents_3);
        verticalLayout_14->setSpacing(4);
        verticalLayout_14->setContentsMargins(11, 11, 11, 11);
        verticalLayout_14->setObjectName(QStringLiteral("verticalLayout_14"));
        verticalLayout_14->setContentsMargins(8, 8, 8, 8);
        horizontalLayout_6 = new QHBoxLayout();
        horizontalLayout_6->setSpacing(4);
        horizontalLayout_6->setObjectName(QStringLiteral("horizontalLayout_6"));
        LoggerCheckUse = new QCheckBox(scrollAreaWidgetContents_3);
        LoggerCheckUse->setObjectName(QStringLiteral("LoggerCheckUse"));
        LoggerCheckUse->setEnabled(false);
        LoggerCheckUse->setChecked(true);

        horizontalLayout_6->addWidget(LoggerCheckUse);


        verticalLayout_14->addLayout(horizontalLayout_6);

        LoggerGraph = new QGraphicsView(scrollAreaWidgetContents_3);
        LoggerGraph->setObjectName(QStringLiteral("LoggerGraph"));
        QBrush brush(QColor(0, 0, 0, 255));
        brush.setStyle(Qt::NoBrush);
        LoggerGraph->setBackgroundBrush(brush);
        LoggerGraph->setInteractive(false);
        LoggerGraph->setRenderHints(QPainter::TextAntialiasing);

        verticalLayout_14->addWidget(LoggerGraph);

        horizontalLayout_5 = new QHBoxLayout();
        horizontalLayout_5->setSpacing(2);
        horizontalLayout_5->setObjectName(QStringLiteral("horizontalLayout_5"));
        verticalLayout_13 = new QVBoxLayout();
        verticalLayout_13->setSpacing(4);
        verticalLayout_13->setObjectName(QStringLiteral("verticalLayout_13"));
        label_4 = new QLabel(scrollAreaWidgetContents_3);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setAlignment(Qt::AlignCenter);

        verticalLayout_13->addWidget(label_4);

        LoggerList = new QTableWidget(scrollAreaWidgetContents_3);
        if (LoggerList->columnCount() < 2)
            LoggerList->setColumnCount(2);
        LoggerList->setObjectName(QStringLiteral("LoggerList"));
        LoggerList->setFocusPolicy(Qt::StrongFocus);
        LoggerList->setEditTriggers(QAbstractItemView::NoEditTriggers);
        LoggerList->setSelectionBehavior(QAbstractItemView::SelectRows);
        LoggerList->setVerticalScrollMode(QAbstractItemView::ScrollPerPixel);
        LoggerList->setHorizontalScrollMode(QAbstractItemView::ScrollPerPixel);
        LoggerList->setWordWrap(false);
        LoggerList->setRowCount(0);
        LoggerList->setColumnCount(2);
        LoggerList->horizontalHeader()->setVisible(false);
        LoggerList->horizontalHeader()->setStretchLastSection(true);
        LoggerList->verticalHeader()->setVisible(false);
        LoggerList->verticalHeader()->setDefaultSectionSize(16);

        verticalLayout_13->addWidget(LoggerList);


        horizontalLayout_5->addLayout(verticalLayout_13);

        verticalLayout_10 = new QVBoxLayout();
        verticalLayout_10->setSpacing(4);
        verticalLayout_10->setObjectName(QStringLiteral("verticalLayout_10"));
        LoggerButtonAdd = new QPushButton(scrollAreaWidgetContents_3);
        LoggerButtonAdd->setObjectName(QStringLiteral("LoggerButtonAdd"));
        QSizePolicy sizePolicy4(QSizePolicy::Fixed, QSizePolicy::Minimum);
        sizePolicy4.setHorizontalStretch(0);
        sizePolicy4.setVerticalStretch(0);
        sizePolicy4.setHeightForWidth(LoggerButtonAdd->sizePolicy().hasHeightForWidth());
        LoggerButtonAdd->setSizePolicy(sizePolicy4);
        LoggerButtonAdd->setMinimumSize(QSize(18, 0));
        LoggerButtonAdd->setMaximumSize(QSize(18, 16777215));
        QFont font;
        font.setFamily(QStringLiteral("Wingdings"));
        LoggerButtonAdd->setFont(font);
        LoggerButtonAdd->setFocusPolicy(Qt::ClickFocus);

        verticalLayout_10->addWidget(LoggerButtonAdd);

        LoggerButtonRemove = new QPushButton(scrollAreaWidgetContents_3);
        LoggerButtonRemove->setObjectName(QStringLiteral("LoggerButtonRemove"));
        sizePolicy4.setHeightForWidth(LoggerButtonRemove->sizePolicy().hasHeightForWidth());
        LoggerButtonRemove->setSizePolicy(sizePolicy4);
        LoggerButtonRemove->setMinimumSize(QSize(18, 0));
        LoggerButtonRemove->setMaximumSize(QSize(18, 16777215));
        LoggerButtonRemove->setFont(font);
        LoggerButtonRemove->setFocusPolicy(Qt::ClickFocus);

        verticalLayout_10->addWidget(LoggerButtonRemove);


        horizontalLayout_5->addLayout(verticalLayout_10);

        verticalLayout_9 = new QVBoxLayout();
        verticalLayout_9->setSpacing(4);
        verticalLayout_9->setObjectName(QStringLiteral("verticalLayout_9"));
        label_5 = new QLabel(scrollAreaWidgetContents_3);
        label_5->setObjectName(QStringLiteral("label_5"));
        label_5->setAlignment(Qt::AlignCenter);

        verticalLayout_9->addWidget(label_5);

        LoggerSaveList = new QTableWidget(scrollAreaWidgetContents_3);
        if (LoggerSaveList->columnCount() < 3)
            LoggerSaveList->setColumnCount(3);
        LoggerSaveList->setObjectName(QStringLiteral("LoggerSaveList"));
        LoggerSaveList->setFocusPolicy(Qt::StrongFocus);
        LoggerSaveList->setEditTriggers(QAbstractItemView::NoEditTriggers);
        LoggerSaveList->setSelectionBehavior(QAbstractItemView::SelectRows);
        LoggerSaveList->setVerticalScrollMode(QAbstractItemView::ScrollPerPixel);
        LoggerSaveList->setHorizontalScrollMode(QAbstractItemView::ScrollPerPixel);
        LoggerSaveList->setWordWrap(false);
        LoggerSaveList->setRowCount(0);
        LoggerSaveList->setColumnCount(3);
        LoggerSaveList->horizontalHeader()->setVisible(false);
        LoggerSaveList->horizontalHeader()->setStretchLastSection(true);
        LoggerSaveList->verticalHeader()->setVisible(false);
        LoggerSaveList->verticalHeader()->setDefaultSectionSize(16);

        verticalLayout_9->addWidget(LoggerSaveList);

        LoggerLabel = new QLabel(scrollAreaWidgetContents_3);
        LoggerLabel->setObjectName(QStringLiteral("LoggerLabel"));

        verticalLayout_9->addWidget(LoggerLabel);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setSpacing(4);
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        LoggerStart = new QPushButton(scrollAreaWidgetContents_3);
        LoggerStart->setObjectName(QStringLiteral("LoggerStart"));

        horizontalLayout_2->addWidget(LoggerStart);

        LoggerStop = new QPushButton(scrollAreaWidgetContents_3);
        LoggerStop->setObjectName(QStringLiteral("LoggerStop"));

        horizontalLayout_2->addWidget(LoggerStop);

        LoggerSave = new QPushButton(scrollAreaWidgetContents_3);
        LoggerSave->setObjectName(QStringLiteral("LoggerSave"));

        horizontalLayout_2->addWidget(LoggerSave);


        verticalLayout_9->addLayout(horizontalLayout_2);


        horizontalLayout_5->addLayout(verticalLayout_9);

        horizontalLayout_5->setStretch(0, 2);
        horizontalLayout_5->setStretch(2, 3);

        verticalLayout_14->addLayout(horizontalLayout_5);

        verticalLayout_14->setStretch(1, 1);
        verticalLayout_14->setStretch(2, 2);
        scrollArea_3->setWidget(scrollAreaWidgetContents_3);

        verticalLayout_11->addWidget(scrollArea_3);

        Tab->addTab(TabLogger, QString());
        TabSetting = new QWidget();
        TabSetting->setObjectName(QStringLiteral("TabSetting"));
        TabSetting->setEnabled(true);
        Tab->addTab(TabSetting, QString());
        splitter->addWidget(Tab);
        frame = new QFrame(splitter);
        frame->setObjectName(QStringLiteral("frame"));
        QSizePolicy sizePolicy5(QSizePolicy::Maximum, QSizePolicy::Minimum);
        sizePolicy5.setHorizontalStretch(0);
        sizePolicy5.setVerticalStretch(0);
        sizePolicy5.setHeightForWidth(frame->sizePolicy().hasHeightForWidth());
        frame->setSizePolicy(sizePolicy5);
        frame->setMinimumSize(QSize(160, 320));
        frame->setMaximumSize(QSize(280, 16777215));
        frame->setFrameShape(QFrame::Box);
        frame->setFrameShadow(QFrame::Sunken);
        verticalLayout = new QVBoxLayout(frame);
        verticalLayout->setSpacing(4);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(4, 4, 4, 4);
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setSpacing(4);
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));
        label = new QLabel(frame);
        label->setObjectName(QStringLiteral("label"));
        sizePolicy3.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy3);
        label->setMinimumSize(QSize(0, 24));
        label->setMaximumSize(QSize(16777215, 24));
        label->setScaledContents(false);
        label->setAlignment(Qt::AlignCenter);

        horizontalLayout_3->addWidget(label);

        ConsoleClear = new QPushButton(frame);
        ConsoleClear->setObjectName(QStringLiteral("ConsoleClear"));
        sizePolicy2.setHeightForWidth(ConsoleClear->sizePolicy().hasHeightForWidth());
        ConsoleClear->setSizePolicy(sizePolicy2);
        ConsoleClear->setMinimumSize(QSize(64, 24));
        ConsoleClear->setMaximumSize(QSize(64, 24));
        ConsoleClear->setBaseSize(QSize(64, 24));
        ConsoleClear->setFocusPolicy(Qt::NoFocus);

        horizontalLayout_3->addWidget(ConsoleClear);


        verticalLayout->addLayout(horizontalLayout_3);

        ConsoleOutput = new QPlainTextEdit(frame);
        ConsoleOutput->setObjectName(QStringLiteral("ConsoleOutput"));
        sizePolicy.setHeightForWidth(ConsoleOutput->sizePolicy().hasHeightForWidth());
        ConsoleOutput->setSizePolicy(sizePolicy);
        QFont font1;
        font1.setFamily(QString::fromUtf8("\357\274\255\357\274\263 \343\202\264\343\202\267\343\203\203\343\202\257"));
        font1.setKerning(false);
        ConsoleOutput->setFont(font1);
        ConsoleOutput->setAcceptDrops(false);
        ConsoleOutput->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOn);
        ConsoleOutput->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
        ConsoleOutput->setUndoRedoEnabled(false);
        ConsoleOutput->setLineWrapMode(QPlainTextEdit::WidgetWidth);
        ConsoleOutput->setReadOnly(false);
        ConsoleOutput->setPlainText(QStringLiteral(""));

        verticalLayout->addWidget(ConsoleOutput);

        horizontalLayout_4 = new QHBoxLayout();
        horizontalLayout_4->setSpacing(0);
        horizontalLayout_4->setObjectName(QStringLiteral("horizontalLayout_4"));
        label_2 = new QLabel(frame);
        label_2->setObjectName(QStringLiteral("label_2"));
        sizePolicy2.setHeightForWidth(label_2->sizePolicy().hasHeightForWidth());
        label_2->setSizePolicy(sizePolicy2);
        label_2->setMinimumSize(QSize(20, 20));
        label_2->setMaximumSize(QSize(20, 20));
        label_2->setBaseSize(QSize(20, 20));
        label_2->setAlignment(Qt::AlignCenter);

        horizontalLayout_4->addWidget(label_2);

        ConsoleInput = new QLineEdit(frame);
        ConsoleInput->setObjectName(QStringLiteral("ConsoleInput"));
        ConsoleInput->setEnabled(true);
        ConsoleInput->setMinimumSize(QSize(0, 20));
        ConsoleInput->setMaximumSize(QSize(16777215, 20));
        ConsoleInput->setFont(font1);
        ConsoleInput->setAcceptDrops(false);
        ConsoleInput->setMaxLength(500);

        horizontalLayout_4->addWidget(ConsoleInput);


        verticalLayout->addLayout(horizontalLayout_4);

        splitter->addWidget(frame);

        horizontalLayout->addWidget(splitter);

        TerminalClass->setCentralWidget(centralWidget);
        StatusBar = new QStatusBar(TerminalClass);
        StatusBar->setObjectName(QStringLiteral("StatusBar"));
        TerminalClass->setStatusBar(StatusBar);
        QWidget::setTabOrder(ConsoleInput, ConsoleOutput);

        retranslateUi(TerminalClass);

        Tab->setCurrentIndex(0);
        FilerToolBox->setCurrentIndex(1);
        FilerToolBox->layout()->setSpacing(0);


        QMetaObject::connectSlotsByName(TerminalClass);
    } // setupUi

    void retranslateUi(QMainWindow *TerminalClass)
    {
        TerminalClass->setWindowTitle(QApplication::translate("TerminalClass", "Terminal", 0));
        InfoButtonReboot->setText(QApplication::translate("TerminalClass", "\345\206\215\350\265\267\345\213\225", 0));
        InfoButtonDisconnect->setText(QApplication::translate("TerminalClass", "\345\210\207\346\226\255", 0));
        InfoButtonConnect->setText(QApplication::translate("TerminalClass", "\346\216\245\347\266\232", 0));
        ControllerShow->setText(QApplication::translate("TerminalClass", "\343\202\263\343\203\263\343\203\210\343\203\255\343\203\274\343\203\251", 0));
        InfoLabelName->setText(QApplication::translate("TerminalClass", "\345\220\215\345\211\215", 0));
        InfoLabelVersion->setText(QApplication::translate("TerminalClass", "\343\203\220\343\203\274\343\202\270\343\203\247\343\203\263", 0));
        ProcessorGroup->setTitle(QApplication::translate("TerminalClass", "\343\203\241\343\202\244\343\203\263\343\203\227\343\203\255\343\202\273\343\203\203\343\202\265", 0));
        label_11->setText(QApplication::translate("TerminalClass", "HEX\343\203\225\343\202\241\343\202\244\343\203\253", 0));
        ProcessorOpen->setText(QApplication::translate("TerminalClass", "...", 0));
        ProcessorWrite->setText(QApplication::translate("TerminalClass", "\346\233\270\343\201\215\350\276\274\343\201\277", 0));
        ProcessorRead->setText(QApplication::translate("TerminalClass", "\350\252\255\343\201\277\345\207\272\343\201\227...", 0));
        BitstreamGroup->setTitle(QApplication::translate("TerminalClass", "\343\203\223\343\203\203\343\203\210\343\202\271\343\203\210\343\203\252\343\203\274\343\203\240", 0));
        label_10->setText(QApplication::translate("TerminalClass", "BIT\343\203\225\343\202\241\343\202\244\343\203\253", 0));
        BitstreamOpen->setText(QApplication::translate("TerminalClass", "...", 0));
        BitstreamSend->setText(QApplication::translate("TerminalClass", "\350\273\242\351\200\201", 0));
        BitstreamWrite->setText(QApplication::translate("TerminalClass", "\346\233\270\343\201\215\350\276\274\343\201\277", 0));
        CoprocessorGroup->setTitle(QApplication::translate("TerminalClass", "\343\202\263\343\203\227\343\203\255\343\202\273\343\203\203\343\202\265", 0));
        label_14->setText(QApplication::translate("TerminalClass", "HEX\343\203\225\343\202\241\343\202\244\343\203\253", 0));
        CoprocessorOpen->setText(QApplication::translate("TerminalClass", "...", 0));
        CoprocessorSend->setText(QApplication::translate("TerminalClass", "\350\273\242\351\200\201", 0));
        CoprocessorWrite->setText(QApplication::translate("TerminalClass", "\346\233\270\343\201\215\350\276\274\343\201\277", 0));
        Tab->setTabText(Tab->indexOf(TabInfo), QApplication::translate("TerminalClass", "\346\203\205\345\240\261", 0));
        FilerToolBox->setItemText(FilerToolBox->indexOf(page), QApplication::translate("TerminalClass", "\343\203\221\343\202\244\343\203\227", 0));
        FileProgress->setFormat(QApplication::translate("TerminalClass", "%vKB/%mKB Used", 0));
        FilerToolBox->setItemText(FilerToolBox->indexOf(page_2), QApplication::translate("TerminalClass", "\343\203\225\343\202\241\343\202\244\343\203\253\343\202\267\343\202\271\343\203\206\343\203\240", 0));
        Tab->setTabText(Tab->indexOf(TabFiler), QApplication::translate("TerminalClass", "\343\203\225\343\202\241\343\202\244\343\203\251\343\203\274", 0));
        LoggerCheckUse->setText(QApplication::translate("TerminalClass", "\343\203\255\343\202\260\343\202\222\350\241\250\347\244\272\343\201\231\343\202\213", 0));
        label_4->setText(QApplication::translate("TerminalClass", "\343\203\255\343\202\260\343\201\214\343\201\250\343\202\214\343\202\213\351\240\205\347\233\256", 0));
#ifndef QT_NO_TOOLTIP
        LoggerButtonAdd->setToolTip(QApplication::translate("TerminalClass", "Add", 0));
#endif // QT_NO_TOOLTIP
        LoggerButtonAdd->setText(QApplication::translate("TerminalClass", "\303\250", 0));
#ifndef QT_NO_TOOLTIP
        LoggerButtonRemove->setToolTip(QApplication::translate("TerminalClass", "Remove", 0));
#endif // QT_NO_TOOLTIP
        LoggerButtonRemove->setText(QApplication::translate("TerminalClass", "\303\247", 0));
        label_5->setText(QApplication::translate("TerminalClass", "\343\203\255\343\202\260\343\202\222\343\201\250\343\202\213\351\240\205\347\233\256", 0));
        LoggerLabel->setText(QApplication::translate("TerminalClass", "TextLabel", 0));
        LoggerStart->setText(QApplication::translate("TerminalClass", "\351\226\213\345\247\213", 0));
        LoggerStop->setText(QApplication::translate("TerminalClass", "\345\201\234\346\255\242", 0));
        LoggerSave->setText(QApplication::translate("TerminalClass", "\344\277\235\345\255\230", 0));
        Tab->setTabText(Tab->indexOf(TabLogger), QApplication::translate("TerminalClass", "\343\203\255\343\202\254\343\203\274", 0));
        Tab->setTabText(Tab->indexOf(TabSetting), QApplication::translate("TerminalClass", "\350\250\255\345\256\232", 0));
        label->setText(QApplication::translate("TerminalClass", "\343\202\263\343\203\263\343\202\275\343\203\274\343\203\253", 0));
        ConsoleClear->setText(QApplication::translate("TerminalClass", "\343\202\257\343\203\252\343\202\242", 0));
        label_2->setText(QApplication::translate("TerminalClass", ">", 0));
    } // retranslateUi

};

namespace Ui {
    class TerminalClass: public Ui_TerminalClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TERMINAL_H
