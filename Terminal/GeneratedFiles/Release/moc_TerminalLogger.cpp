/****************************************************************************
** Meta object code from reading C++ file 'TerminalLogger.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/Terminal/TerminalLogger.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TerminalLogger.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TerminalLogger_t {
    QByteArrayData data[25];
    char stringdata[236];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_TerminalLogger_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_TerminalLogger_t qt_meta_stringdata_TerminalLogger = {
    {
QT_MOC_LITERAL(0, 0, 14),
QT_MOC_LITERAL(1, 15, 15),
QT_MOC_LITERAL(2, 31, 0),
QT_MOC_LITERAL(3, 32, 5),
QT_MOC_LITERAL(4, 38, 4),
QT_MOC_LITERAL(5, 43, 4),
QT_MOC_LITERAL(6, 48, 9),
QT_MOC_LITERAL(7, 58, 12),
QT_MOC_LITERAL(8, 71, 11),
QT_MOC_LITERAL(9, 83, 10),
QT_MOC_LITERAL(10, 94, 10),
QT_MOC_LITERAL(11, 105, 8),
QT_MOC_LITERAL(12, 114, 6),
QT_MOC_LITERAL(13, 121, 7),
QT_MOC_LITERAL(14, 129, 4),
QT_MOC_LITERAL(15, 134, 6),
QT_MOC_LITERAL(16, 141, 6),
QT_MOC_LITERAL(17, 148, 12),
QT_MOC_LITERAL(18, 161, 10),
QT_MOC_LITERAL(19, 172, 12),
QT_MOC_LITERAL(20, 185, 4),
QT_MOC_LITERAL(21, 190, 10),
QT_MOC_LITERAL(22, 201, 15),
QT_MOC_LITERAL(23, 217, 4),
QT_MOC_LITERAL(24, 222, 12)
    },
    "TerminalLogger\0sendLoggingList\0\0char*\0"
    "list\0size\0addPushed\0removePushed\0"
    "startPushed\0stopPushed\0savePushed\0"
    "QAction*\0enable\0enabled\0idle\0pipe_r\0"
    "update\0clearLogInfo\0setLogInfo\0"
    "std::wstring\0name\0receiveLog\0"
    "unsigned short*\0data\0receiveError\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TerminalLogger[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      14,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   84,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
       6,    0,   89,    2, 0x08,
       7,    0,   90,    2, 0x08,
       8,    0,   91,    2, 0x08,
       9,    0,   92,    2, 0x08,
      10,    1,   93,    2, 0x08,
      12,    3,   96,    2, 0x0a,
      12,    2,  103,    2, 0x2a,
      12,    1,  108,    2, 0x2a,
      16,    0,  111,    2, 0x0a,
      17,    0,  112,    2, 0x0a,
      18,    1,  113,    2, 0x0a,
      21,    2,  116,    2, 0x0a,
      24,    0,  121,    2, 0x0a,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3, QMetaType::UInt,    4,    5,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 11,    2,
    QMetaType::Void, QMetaType::Bool, QMetaType::Bool, QMetaType::Bool,   13,   14,   15,
    QMetaType::Void, QMetaType::Bool, QMetaType::Bool,   13,   14,
    QMetaType::Void, QMetaType::Bool,   13,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 19,   20,
    QMetaType::Void, 0x80000000 | 22, QMetaType::UInt,   23,    5,
    QMetaType::Void,

       0        // eod
};

void TerminalLogger::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TerminalLogger *_t = static_cast<TerminalLogger *>(_o);
        switch (_id) {
        case 0: _t->sendLoggingList((*reinterpret_cast< char*(*)>(_a[1])),(*reinterpret_cast< uint(*)>(_a[2]))); break;
        case 1: _t->addPushed(); break;
        case 2: _t->removePushed(); break;
        case 3: _t->startPushed(); break;
        case 4: _t->stopPushed(); break;
        case 5: _t->savePushed((*reinterpret_cast< QAction*(*)>(_a[1]))); break;
        case 6: _t->enable((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3]))); break;
        case 7: _t->enable((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 8: _t->enable((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 9: _t->update(); break;
        case 10: _t->clearLogInfo(); break;
        case 11: _t->setLogInfo((*reinterpret_cast< const std::wstring(*)>(_a[1]))); break;
        case 12: _t->receiveLog((*reinterpret_cast< unsigned short*(*)>(_a[1])),(*reinterpret_cast< uint(*)>(_a[2]))); break;
        case 13: _t->receiveError(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QAction* >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (TerminalLogger::*_t)(char * , unsigned int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalLogger::sendLoggingList)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject TerminalLogger::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TerminalLogger.data,
      qt_meta_data_TerminalLogger,  qt_static_metacall, 0, 0}
};


const QMetaObject *TerminalLogger::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TerminalLogger::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TerminalLogger.stringdata))
        return static_cast<void*>(const_cast< TerminalLogger*>(this));
    return QObject::qt_metacast(_clname);
}

int TerminalLogger::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 14)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 14)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    }
    return _id;
}

// SIGNAL 0
void TerminalLogger::sendLoggingList(char * _t1, unsigned int _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
