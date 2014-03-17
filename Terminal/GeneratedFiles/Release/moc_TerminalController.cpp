/****************************************************************************
** Meta object code from reading C++ file 'TerminalController.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/Terminal/TerminalController.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TerminalController.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TerminalController_t {
    QByteArrayData data[20];
    char stringdata[244];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_TerminalController_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_TerminalController_t qt_meta_stringdata_TerminalController = {
    {
QT_MOC_LITERAL(0, 0, 18),
QT_MOC_LITERAL(1, 19, 18),
QT_MOC_LITERAL(2, 38, 0),
QT_MOC_LITERAL(3, 39, 18),
QT_MOC_LITERAL(4, 58, 5),
QT_MOC_LITERAL(5, 64, 6),
QT_MOC_LITERAL(6, 71, 4),
QT_MOC_LITERAL(7, 76, 6),
QT_MOC_LITERAL(8, 83, 10),
QT_MOC_LITERAL(9, 94, 11),
QT_MOC_LITERAL(10, 106, 7),
QT_MOC_LITERAL(11, 114, 15),
QT_MOC_LITERAL(12, 130, 5),
QT_MOC_LITERAL(13, 136, 15),
QT_MOC_LITERAL(14, 152, 16),
QT_MOC_LITERAL(15, 169, 14),
QT_MOC_LITERAL(16, 184, 11),
QT_MOC_LITERAL(17, 196, 12),
QT_MOC_LITERAL(18, 209, 10),
QT_MOC_LITERAL(19, 220, 22)
    },
    "TerminalController\0setControllerState\0"
    "\0ControllerState_t*\0state\0enable\0idle\0"
    "cont_w\0onInterval\0showToggled\0checked\0"
    "rotationChanged\0value\0rotationPressed\0"
    "rotationReleased\0dribbleChanged\0"
    "kickChanged\0normalPushed\0chipPushed\0"
    "requestControllerState\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TerminalController[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      15,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   89,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
       5,    3,   92,    2, 0x0a,
       5,    2,   99,    2, 0x2a,
       5,    1,  104,    2, 0x2a,
       8,    0,  107,    2, 0x08,
       9,    1,  108,    2, 0x08,
      10,    1,  111,    2, 0x08,
      11,    1,  114,    2, 0x08,
      13,    0,  117,    2, 0x08,
      14,    0,  118,    2, 0x08,
      15,    1,  119,    2, 0x08,
      16,    1,  122,    2, 0x08,
      17,    0,  125,    2, 0x08,
      18,    0,  126,    2, 0x08,
      19,    0,  127,    2, 0x0a,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,

 // slots: parameters
    QMetaType::Void, QMetaType::Bool, QMetaType::Bool, QMetaType::Bool,    5,    6,    7,
    QMetaType::Void, QMetaType::Bool, QMetaType::Bool,    5,    6,
    QMetaType::Void, QMetaType::Bool,    5,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    4,
    QMetaType::Void, QMetaType::Int,    4,
    QMetaType::Void, QMetaType::Int,   12,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   12,
    QMetaType::Void, QMetaType::Int,   12,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void TerminalController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TerminalController *_t = static_cast<TerminalController *>(_o);
        switch (_id) {
        case 0: _t->setControllerState((*reinterpret_cast< ControllerState_t*(*)>(_a[1]))); break;
        case 1: _t->enable((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3]))); break;
        case 2: _t->enable((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 3: _t->enable((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->onInterval(); break;
        case 5: _t->showToggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 6: _t->checked((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->rotationChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->rotationPressed(); break;
        case 9: _t->rotationReleased(); break;
        case 10: _t->dribbleChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 11: _t->kickChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 12: _t->normalPushed(); break;
        case 13: _t->chipPushed(); break;
        case 14: _t->requestControllerState(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (TerminalController::*_t)(ControllerState_t * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalController::setControllerState)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject TerminalController::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_TerminalController.data,
      qt_meta_data_TerminalController,  qt_static_metacall, 0, 0}
};


const QMetaObject *TerminalController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TerminalController::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TerminalController.stringdata))
        return static_cast<void*>(const_cast< TerminalController*>(this));
    return QDialog::qt_metacast(_clname);
}

int TerminalController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 15)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 15)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 15;
    }
    return _id;
}

// SIGNAL 0
void TerminalController::setControllerState(ControllerState_t * _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
