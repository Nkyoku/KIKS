/****************************************************************************
** Meta object code from reading C++ file 'TerminalInfo.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/Terminal/TerminalInfo.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TerminalInfo.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TerminalInfo_t {
    QByteArrayData data[22];
    char stringdata[220];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_TerminalInfo_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_TerminalInfo_t qt_meta_stringdata_TerminalInfo = {
    {
QT_MOC_LITERAL(0, 0, 12),
QT_MOC_LITERAL(1, 13, 16),
QT_MOC_LITERAL(2, 30, 0),
QT_MOC_LITERAL(3, 31, 19),
QT_MOC_LITERAL(4, 51, 3),
QT_MOC_LITERAL(5, 55, 7),
QT_MOC_LITERAL(6, 63, 4),
QT_MOC_LITERAL(7, 68, 13),
QT_MOC_LITERAL(8, 82, 14),
QT_MOC_LITERAL(9, 97, 4),
QT_MOC_LITERAL(10, 102, 6),
QT_MOC_LITERAL(11, 109, 4),
QT_MOC_LITERAL(12, 114, 12),
QT_MOC_LITERAL(13, 127, 8),
QT_MOC_LITERAL(14, 136, 4),
QT_MOC_LITERAL(15, 141, 11),
QT_MOC_LITERAL(16, 153, 5),
QT_MOC_LITERAL(17, 159, 13),
QT_MOC_LITERAL(18, 173, 8),
QT_MOC_LITERAL(19, 182, 6),
QT_MOC_LITERAL(20, 189, 16),
QT_MOC_LITERAL(21, 206, 12)
    },
    "TerminalInfo\0changeConnection\0\0"
    "const std::wstring*\0phy\0connect\0warn\0"
    "rebootRequest\0const wchar_t*\0mode\0"
    "enable\0idle\0setDebugText\0QString&\0"
    "text\0setProgress\0value\0connectPushed\0"
    "QAction*\0action\0disconnectPushed\0"
    "rebootPushed\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TerminalInfo[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    3,   54,    2, 0x05,
       7,    1,   61,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
      10,    2,   64,    2, 0x0a,
      12,    1,   69,    2, 0x0a,
      15,    1,   72,    2, 0x0a,
      17,    1,   75,    2, 0x08,
      20,    0,   78,    2, 0x08,
      21,    1,   79,    2, 0x08,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3, QMetaType::Bool, QMetaType::Bool,    4,    5,    6,
    QMetaType::Void, 0x80000000 | 8,    9,

 // slots: parameters
    QMetaType::Void, QMetaType::Bool, QMetaType::Bool,   10,   11,
    QMetaType::Void, 0x80000000 | 13,   14,
    QMetaType::Void, QMetaType::Int,   16,
    QMetaType::Void, 0x80000000 | 18,   19,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 18,   19,

       0        // eod
};

void TerminalInfo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TerminalInfo *_t = static_cast<TerminalInfo *>(_o);
        switch (_id) {
        case 0: _t->changeConnection((*reinterpret_cast< const std::wstring*(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3]))); break;
        case 1: _t->rebootRequest((*reinterpret_cast< const wchar_t*(*)>(_a[1]))); break;
        case 2: _t->enable((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 3: _t->setDebugText((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->setProgress((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->connectPushed((*reinterpret_cast< QAction*(*)>(_a[1]))); break;
        case 6: _t->disconnectPushed(); break;
        case 7: _t->rebootPushed((*reinterpret_cast< QAction*(*)>(_a[1]))); break;
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
        case 7:
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
            typedef void (TerminalInfo::*_t)(const std::wstring * , bool , bool );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalInfo::changeConnection)) {
                *result = 0;
            }
        }
        {
            typedef void (TerminalInfo::*_t)(const wchar_t * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalInfo::rebootRequest)) {
                *result = 1;
            }
        }
    }
}

const QMetaObject TerminalInfo::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TerminalInfo.data,
      qt_meta_data_TerminalInfo,  qt_static_metacall, 0, 0}
};


const QMetaObject *TerminalInfo::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TerminalInfo::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TerminalInfo.stringdata))
        return static_cast<void*>(const_cast< TerminalInfo*>(this));
    return QObject::qt_metacast(_clname);
}

int TerminalInfo::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}

// SIGNAL 0
void TerminalInfo::changeConnection(const std::wstring * _t1, bool _t2, bool _t3)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)), const_cast<void*>(reinterpret_cast<const void*>(&_t3)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void TerminalInfo::rebootRequest(const wchar_t * _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
