/****************************************************************************
** Meta object code from reading C++ file 'TerminalAsync.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/Terminal/TerminalAsync.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TerminalAsync.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TerminalAsync_t {
    QByteArrayData data[32];
    char stringdata[387];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_TerminalAsync_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_TerminalAsync_t qt_meta_stringdata_TerminalAsync = {
    {
QT_MOC_LITERAL(0, 0, 13),
QT_MOC_LITERAL(1, 14, 7),
QT_MOC_LITERAL(2, 22, 0),
QT_MOC_LITERAL(3, 23, 15),
QT_MOC_LITERAL(4, 39, 4),
QT_MOC_LITERAL(5, 44, 4),
QT_MOC_LITERAL(6, 49, 16),
QT_MOC_LITERAL(7, 66, 22),
QT_MOC_LITERAL(8, 89, 16),
QT_MOC_LITERAL(9, 106, 14),
QT_MOC_LITERAL(10, 121, 5),
QT_MOC_LITERAL(11, 127, 7),
QT_MOC_LITERAL(12, 135, 12),
QT_MOC_LITERAL(13, 148, 5),
QT_MOC_LITERAL(14, 154, 17),
QT_MOC_LITERAL(15, 172, 6),
QT_MOC_LITERAL(16, 179, 16),
QT_MOC_LITERAL(17, 196, 13),
QT_MOC_LITERAL(18, 210, 8),
QT_MOC_LITERAL(19, 219, 8),
QT_MOC_LITERAL(20, 228, 18),
QT_MOC_LITERAL(21, 247, 17),
QT_MOC_LITERAL(22, 265, 6),
QT_MOC_LITERAL(23, 272, 4),
QT_MOC_LITERAL(24, 277, 17),
QT_MOC_LITERAL(25, 295, 14),
QT_MOC_LITERAL(26, 310, 5),
QT_MOC_LITERAL(27, 316, 4),
QT_MOC_LITERAL(28, 321, 20),
QT_MOC_LITERAL(29, 342, 18),
QT_MOC_LITERAL(30, 361, 18),
QT_MOC_LITERAL(31, 380, 5)
    },
    "TerminalAsync\0sendLog\0\0unsigned short*\0"
    "data\0size\0sendLoggingError\0"
    "requestControllerState\0showWarningConst\0"
    "const wchar_t*\0title\0content\0sendProgress\0"
    "value\0setExclusiveState\0enable\0"
    "transfarToDevice\0std::wstring*\0dst_path\0"
    "src_path\0transfarFromDevice\0"
    "onAccessOperation\0letter\0path\0"
    "onLoggingInterval\0setLoggingList\0char*\0"
    "list\0onControllerInterval\0setControllerState\0"
    "ControllerState_t*\0state\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TerminalAsync[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   79,    2, 0x05,
       6,    0,   84,    2, 0x05,
       7,    0,   85,    2, 0x05,
       8,    2,   86,    2, 0x05,
      12,    1,   91,    2, 0x05,
      14,    1,   94,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
      16,    2,   97,    2, 0x0a,
      20,    2,  102,    2, 0x0a,
      21,    2,  107,    2, 0x0a,
      24,    0,  112,    2, 0x08,
      25,    2,  113,    2, 0x0a,
      28,    0,  118,    2, 0x08,
      29,    1,  119,    2, 0x0a,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3, QMetaType::UInt,    4,    5,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 9, 0x80000000 | 9,   10,   11,
    QMetaType::Void, QMetaType::Int,   13,
    QMetaType::Void, QMetaType::Bool,   15,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 17, 0x80000000 | 17,   18,   19,
    QMetaType::Void, 0x80000000 | 17, 0x80000000 | 17,   18,   19,
    QMetaType::Void, QMetaType::Char, 0x80000000 | 17,   22,   23,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 26, QMetaType::UInt,   27,    5,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 30,   31,

       0        // eod
};

void TerminalAsync::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TerminalAsync *_t = static_cast<TerminalAsync *>(_o);
        switch (_id) {
        case 0: _t->sendLog((*reinterpret_cast< unsigned short*(*)>(_a[1])),(*reinterpret_cast< uint(*)>(_a[2]))); break;
        case 1: _t->sendLoggingError(); break;
        case 2: _t->requestControllerState(); break;
        case 3: _t->showWarningConst((*reinterpret_cast< const wchar_t*(*)>(_a[1])),(*reinterpret_cast< const wchar_t*(*)>(_a[2]))); break;
        case 4: _t->sendProgress((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->setExclusiveState((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 6: _t->transfarToDevice((*reinterpret_cast< std::wstring*(*)>(_a[1])),(*reinterpret_cast< std::wstring*(*)>(_a[2]))); break;
        case 7: _t->transfarFromDevice((*reinterpret_cast< std::wstring*(*)>(_a[1])),(*reinterpret_cast< std::wstring*(*)>(_a[2]))); break;
        case 8: _t->onAccessOperation((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< std::wstring*(*)>(_a[2]))); break;
        case 9: _t->onLoggingInterval(); break;
        case 10: _t->setLoggingList((*reinterpret_cast< char*(*)>(_a[1])),(*reinterpret_cast< uint(*)>(_a[2]))); break;
        case 11: _t->onControllerInterval(); break;
        case 12: _t->setControllerState((*reinterpret_cast< ControllerState_t*(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (TerminalAsync::*_t)(unsigned short * , unsigned int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalAsync::sendLog)) {
                *result = 0;
            }
        }
        {
            typedef void (TerminalAsync::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalAsync::sendLoggingError)) {
                *result = 1;
            }
        }
        {
            typedef void (TerminalAsync::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalAsync::requestControllerState)) {
                *result = 2;
            }
        }
        {
            typedef void (TerminalAsync::*_t)(const wchar_t * , const wchar_t * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalAsync::showWarningConst)) {
                *result = 3;
            }
        }
        {
            typedef void (TerminalAsync::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalAsync::sendProgress)) {
                *result = 4;
            }
        }
        {
            typedef void (TerminalAsync::*_t)(bool );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalAsync::setExclusiveState)) {
                *result = 5;
            }
        }
    }
}

const QMetaObject TerminalAsync::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TerminalAsync.data,
      qt_meta_data_TerminalAsync,  qt_static_metacall, 0, 0}
};


const QMetaObject *TerminalAsync::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TerminalAsync::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TerminalAsync.stringdata))
        return static_cast<void*>(const_cast< TerminalAsync*>(this));
    return QObject::qt_metacast(_clname);
}

int TerminalAsync::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 13)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 13;
    }
    return _id;
}

// SIGNAL 0
void TerminalAsync::sendLog(unsigned short * _t1, unsigned int _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void TerminalAsync::sendLoggingError()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void TerminalAsync::requestControllerState()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void TerminalAsync::showWarningConst(const wchar_t * _t1, const wchar_t * _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void TerminalAsync::sendProgress(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void TerminalAsync::setExclusiveState(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_END_MOC_NAMESPACE
