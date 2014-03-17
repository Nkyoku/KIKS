/****************************************************************************
** Meta object code from reading C++ file 'TerminalAccess.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/Terminal/TerminalAccess.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TerminalAccess.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TerminalAccess_t {
    QByteArrayData data[12];
    char stringdata[101];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_TerminalAccess_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_TerminalAccess_t qt_meta_stringdata_TerminalAccess = {
    {
QT_MOC_LITERAL(0, 0, 14),
QT_MOC_LITERAL(1, 15, 9),
QT_MOC_LITERAL(2, 25, 0),
QT_MOC_LITERAL(3, 26, 6),
QT_MOC_LITERAL(4, 33, 13),
QT_MOC_LITERAL(5, 47, 4),
QT_MOC_LITERAL(6, 52, 6),
QT_MOC_LITERAL(7, 59, 4),
QT_MOC_LITERAL(8, 64, 5),
QT_MOC_LITERAL(9, 70, 5),
QT_MOC_LITERAL(10, 76, 10),
QT_MOC_LITERAL(11, 87, 12)
    },
    "TerminalAccess\0operation\0\0letter\0"
    "std::wstring*\0path\0enable\0idle\0func1\0"
    "func2\0openDialog\0buttonPushed\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TerminalAccess[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   49,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
       6,    5,   54,    2, 0x0a,
       6,    4,   65,    2, 0x2a,
       6,    3,   74,    2, 0x2a,
       6,    2,   81,    2, 0x2a,
      10,    0,   86,    2, 0x08,
      11,    0,   87,    2, 0x08,

 // signals: parameters
    QMetaType::Void, QMetaType::Char, 0x80000000 | 4,    3,    5,

 // slots: parameters
    QMetaType::Void, QMetaType::Char, QMetaType::Bool, QMetaType::Bool, QMetaType::Bool, QMetaType::Bool,    3,    6,    7,    8,    9,
    QMetaType::Void, QMetaType::Char, QMetaType::Bool, QMetaType::Bool, QMetaType::Bool,    3,    6,    7,    8,
    QMetaType::Void, QMetaType::Char, QMetaType::Bool, QMetaType::Bool,    3,    6,    7,
    QMetaType::Void, QMetaType::Char, QMetaType::Bool,    3,    6,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void TerminalAccess::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TerminalAccess *_t = static_cast<TerminalAccess *>(_o);
        switch (_id) {
        case 0: _t->operation((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< std::wstring*(*)>(_a[2]))); break;
        case 1: _t->enable((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3])),(*reinterpret_cast< bool(*)>(_a[4])),(*reinterpret_cast< bool(*)>(_a[5]))); break;
        case 2: _t->enable((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3])),(*reinterpret_cast< bool(*)>(_a[4]))); break;
        case 3: _t->enable((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3]))); break;
        case 4: _t->enable((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 5: _t->openDialog(); break;
        case 6: _t->buttonPushed(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (TerminalAccess::*_t)(char , std::wstring * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalAccess::operation)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject TerminalAccess::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TerminalAccess.data,
      qt_meta_data_TerminalAccess,  qt_static_metacall, 0, 0}
};


const QMetaObject *TerminalAccess::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TerminalAccess::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TerminalAccess.stringdata))
        return static_cast<void*>(const_cast< TerminalAccess*>(this));
    return QObject::qt_metacast(_clname);
}

int TerminalAccess::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void TerminalAccess::operation(char _t1, std::wstring * _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
