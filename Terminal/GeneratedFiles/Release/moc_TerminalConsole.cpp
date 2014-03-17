/****************************************************************************
** Meta object code from reading C++ file 'TerminalConsole.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/Terminal/TerminalConsole.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TerminalConsole.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TerminalConsole_t {
    QByteArrayData data[9];
    char stringdata[67];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_TerminalConsole_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_TerminalConsole_t qt_meta_stringdata_TerminalConsole = {
    {
QT_MOC_LITERAL(0, 0, 15),
QT_MOC_LITERAL(1, 16, 4),
QT_MOC_LITERAL(2, 21, 0),
QT_MOC_LITERAL(3, 22, 3),
QT_MOC_LITERAL(4, 26, 6),
QT_MOC_LITERAL(5, 33, 7),
QT_MOC_LITERAL(6, 41, 5),
QT_MOC_LITERAL(7, 47, 6),
QT_MOC_LITERAL(8, 54, 11)
    },
    "TerminalConsole\0send\0\0str\0enable\0"
    "focused\0clear\0append\0std::string\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TerminalConsole[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   44,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
       4,    1,   47,    2, 0x0a,
       5,    0,   50,    2, 0x0a,
       6,    0,   51,    2, 0x0a,
       7,    1,   52,    2, 0x0a,
       7,    1,   55,    2, 0x0a,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,

 // slots: parameters
    QMetaType::Void, QMetaType::Bool,    4,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 8,    3,
    QMetaType::Void, QMetaType::QString,    3,

       0        // eod
};

void TerminalConsole::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TerminalConsole *_t = static_cast<TerminalConsole *>(_o);
        switch (_id) {
        case 0: _t->send((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->enable((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->focused(); break;
        case 3: _t->clear(); break;
        case 4: _t->append((*reinterpret_cast< const std::string(*)>(_a[1]))); break;
        case 5: _t->append((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (TerminalConsole::*_t)(const QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TerminalConsole::send)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject TerminalConsole::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TerminalConsole.data,
      qt_meta_data_TerminalConsole,  qt_static_metacall, 0, 0}
};


const QMetaObject *TerminalConsole::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TerminalConsole::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TerminalConsole.stringdata))
        return static_cast<void*>(const_cast< TerminalConsole*>(this));
    return QObject::qt_metacast(_clname);
}

int TerminalConsole::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void TerminalConsole::send(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
