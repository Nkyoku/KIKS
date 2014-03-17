/********************************************************************************
** Form generated from reading UI file 'Controller.ui'
**
** Created by: Qt User Interface Compiler version 5.1.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CONTROLLER_H
#define UI_CONTROLLER_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGraphicsView>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSlider>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_ControllerClass
{
public:
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_2;
    QCheckBox *CheckUse;
    QSpacerItem *horizontalSpacer_3;
    QSpinBox *SpinScale;
    QHBoxLayout *horizontalLayout;
    QGraphicsView *Pad;
    QSlider *SliderRotation;
    QHBoxLayout *horizontalLayout_10;
    QLabel *label_4;
    QSlider *SliderDribble;
    QLabel *LabelDribble;
    QHBoxLayout *horizontalLayout_6;
    QLabel *label_3;
    QSlider *SliderKick;
    QLabel *LabelKick;
    QHBoxLayout *horizontalLayout_7;
    QSpacerItem *horizontalSpacer_26;
    QPushButton *ButtonNormal;
    QPushButton *ButtonChip;

    void setupUi(QDialog *ControllerClass)
    {
        if (ControllerClass->objectName().isEmpty())
            ControllerClass->setObjectName(QStringLiteral("ControllerClass"));
        ControllerClass->resize(240, 360);
        ControllerClass->setMinimumSize(QSize(240, 360));
        verticalLayout = new QVBoxLayout(ControllerClass);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setSpacing(2);
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        CheckUse = new QCheckBox(ControllerClass);
        CheckUse->setObjectName(QStringLiteral("CheckUse"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Maximum);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(CheckUse->sizePolicy().hasHeightForWidth());
        CheckUse->setSizePolicy(sizePolicy);

        horizontalLayout_2->addWidget(CheckUse);

        horizontalSpacer_3 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer_3);

        SpinScale = new QSpinBox(ControllerClass);
        SpinScale->setObjectName(QStringLiteral("SpinScale"));
        SpinScale->setFocusPolicy(Qt::NoFocus);
        SpinScale->setKeyboardTracking(false);
        SpinScale->setMinimum(1);
        SpinScale->setMaximum(4);
        SpinScale->setValue(2);

        horizontalLayout_2->addWidget(SpinScale);


        verticalLayout->addLayout(horizontalLayout_2);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(0);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        Pad = new QGraphicsView(ControllerClass);
        Pad->setObjectName(QStringLiteral("Pad"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::MinimumExpanding);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(Pad->sizePolicy().hasHeightForWidth());
        Pad->setSizePolicy(sizePolicy1);
        Pad->setMinimumSize(QSize(150, 150));
        Pad->viewport()->setProperty("cursor", QVariant(QCursor(Qt::CrossCursor)));
        Pad->setFocusPolicy(Qt::NoFocus);
        Pad->setAcceptDrops(false);
        Pad->setFrameShape(QFrame::Panel);
        Pad->setLineWidth(2);
        Pad->setInteractive(false);
        Pad->setSceneRect(QRectF(0, 0, 0, 0));
        Pad->setRenderHints(QPainter::Antialiasing|QPainter::TextAntialiasing);

        horizontalLayout->addWidget(Pad);


        verticalLayout->addLayout(horizontalLayout);

        SliderRotation = new QSlider(ControllerClass);
        SliderRotation->setObjectName(QStringLiteral("SliderRotation"));
        QSizePolicy sizePolicy2(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(SliderRotation->sizePolicy().hasHeightForWidth());
        SliderRotation->setSizePolicy(sizePolicy2);
        SliderRotation->setFocusPolicy(Qt::NoFocus);
        SliderRotation->setMinimum(-65536);
        SliderRotation->setMaximum(65536);
        SliderRotation->setSingleStep(0);
        SliderRotation->setPageStep(0);
        SliderRotation->setOrientation(Qt::Horizontal);
        SliderRotation->setTickPosition(QSlider::TicksBothSides);
        SliderRotation->setTickInterval(16384);

        verticalLayout->addWidget(SliderRotation);

        horizontalLayout_10 = new QHBoxLayout();
        horizontalLayout_10->setSpacing(4);
        horizontalLayout_10->setObjectName(QStringLiteral("horizontalLayout_10"));
        label_4 = new QLabel(ControllerClass);
        label_4->setObjectName(QStringLiteral("label_4"));
        QSizePolicy sizePolicy3(QSizePolicy::Fixed, QSizePolicy::Preferred);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(0);
        sizePolicy3.setHeightForWidth(label_4->sizePolicy().hasHeightForWidth());
        label_4->setSizePolicy(sizePolicy3);
        label_4->setMinimumSize(QSize(48, 0));
        label_4->setMaximumSize(QSize(48, 16777215));

        horizontalLayout_10->addWidget(label_4);

        SliderDribble = new QSlider(ControllerClass);
        SliderDribble->setObjectName(QStringLiteral("SliderDribble"));
        SliderDribble->setFocusPolicy(Qt::NoFocus);
        SliderDribble->setMaximum(255);
        SliderDribble->setSingleStep(32);
        SliderDribble->setPageStep(32);
        SliderDribble->setOrientation(Qt::Horizontal);
        SliderDribble->setTickPosition(QSlider::TicksAbove);
        SliderDribble->setTickInterval(32);

        horizontalLayout_10->addWidget(SliderDribble);

        LabelDribble = new QLabel(ControllerClass);
        LabelDribble->setObjectName(QStringLiteral("LabelDribble"));
        sizePolicy3.setHeightForWidth(LabelDribble->sizePolicy().hasHeightForWidth());
        LabelDribble->setSizePolicy(sizePolicy3);
        LabelDribble->setMinimumSize(QSize(40, 0));
        LabelDribble->setMaximumSize(QSize(40, 16777215));
        LabelDribble->setBaseSize(QSize(48, 0));
        LabelDribble->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        horizontalLayout_10->addWidget(LabelDribble);


        verticalLayout->addLayout(horizontalLayout_10);

        horizontalLayout_6 = new QHBoxLayout();
        horizontalLayout_6->setSpacing(4);
        horizontalLayout_6->setObjectName(QStringLiteral("horizontalLayout_6"));
        label_3 = new QLabel(ControllerClass);
        label_3->setObjectName(QStringLiteral("label_3"));
        sizePolicy3.setHeightForWidth(label_3->sizePolicy().hasHeightForWidth());
        label_3->setSizePolicy(sizePolicy3);
        label_3->setMinimumSize(QSize(48, 0));
        label_3->setMaximumSize(QSize(48, 16777215));

        horizontalLayout_6->addWidget(label_3);

        SliderKick = new QSlider(ControllerClass);
        SliderKick->setObjectName(QStringLiteral("SliderKick"));
        SliderKick->setFocusPolicy(Qt::NoFocus);
        SliderKick->setMaximum(255);
        SliderKick->setSingleStep(32);
        SliderKick->setPageStep(32);
        SliderKick->setOrientation(Qt::Horizontal);
        SliderKick->setTickPosition(QSlider::TicksAbove);
        SliderKick->setTickInterval(32);

        horizontalLayout_6->addWidget(SliderKick);

        LabelKick = new QLabel(ControllerClass);
        LabelKick->setObjectName(QStringLiteral("LabelKick"));
        sizePolicy3.setHeightForWidth(LabelKick->sizePolicy().hasHeightForWidth());
        LabelKick->setSizePolicy(sizePolicy3);
        LabelKick->setMinimumSize(QSize(40, 0));
        LabelKick->setMaximumSize(QSize(40, 16777215));
        LabelKick->setBaseSize(QSize(48, 0));
        LabelKick->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        horizontalLayout_6->addWidget(LabelKick);


        verticalLayout->addLayout(horizontalLayout_6);

        horizontalLayout_7 = new QHBoxLayout();
        horizontalLayout_7->setSpacing(8);
        horizontalLayout_7->setObjectName(QStringLiteral("horizontalLayout_7"));
        horizontalSpacer_26 = new QSpacerItem(62, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_7->addItem(horizontalSpacer_26);

        ButtonNormal = new QPushButton(ControllerClass);
        ButtonNormal->setObjectName(QStringLiteral("ButtonNormal"));
        QSizePolicy sizePolicy4(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy4.setHorizontalStretch(0);
        sizePolicy4.setVerticalStretch(0);
        sizePolicy4.setHeightForWidth(ButtonNormal->sizePolicy().hasHeightForWidth());
        ButtonNormal->setSizePolicy(sizePolicy4);
        ButtonNormal->setFocusPolicy(Qt::NoFocus);
        ButtonNormal->setDefault(false);
        ButtonNormal->setFlat(false);

        horizontalLayout_7->addWidget(ButtonNormal);

        ButtonChip = new QPushButton(ControllerClass);
        ButtonChip->setObjectName(QStringLiteral("ButtonChip"));
        sizePolicy4.setHeightForWidth(ButtonChip->sizePolicy().hasHeightForWidth());
        ButtonChip->setSizePolicy(sizePolicy4);
        ButtonChip->setFocusPolicy(Qt::NoFocus);

        horizontalLayout_7->addWidget(ButtonChip);


        verticalLayout->addLayout(horizontalLayout_7);


        retranslateUi(ControllerClass);

        QMetaObject::connectSlotsByName(ControllerClass);
    } // setupUi

    void retranslateUi(QDialog *ControllerClass)
    {
        ControllerClass->setWindowTitle(QApplication::translate("ControllerClass", "\343\202\263\343\203\263\343\203\210\343\203\255\343\203\274\343\203\251", 0));
        CheckUse->setText(QApplication::translate("ControllerClass", "\343\202\263\343\203\263\343\203\210\343\203\255\343\203\274\343\203\251\343\202\222\344\275\277\347\224\250\343\201\231\343\202\213", 0));
        SpinScale->setSuffix(QString());
        SpinScale->setPrefix(QApplication::translate("ControllerClass", "x", 0));
        label_4->setText(QApplication::translate("ControllerClass", "\343\203\211\343\203\252\343\203\226\343\203\253", 0));
        LabelDribble->setText(QApplication::translate("ControllerClass", "Power", 0));
        label_3->setText(QApplication::translate("ControllerClass", "\343\202\255\343\203\203\343\202\257", 0));
        LabelKick->setText(QApplication::translate("ControllerClass", "Power", 0));
        ButtonNormal->setText(QApplication::translate("ControllerClass", "\343\203\216\343\203\274\343\203\236\343\203\253\343\202\255\343\203\203\343\202\257", 0));
        ButtonChip->setText(QApplication::translate("ControllerClass", "\343\203\201\343\203\203\343\203\227\343\202\255\343\203\203\343\202\257", 0));
    } // retranslateUi

};

namespace Ui {
    class ControllerClass: public Ui_ControllerClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CONTROLLER_H
