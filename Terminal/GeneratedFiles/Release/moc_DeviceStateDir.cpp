/****************************************************************************
** Meta object code from reading C++ file 'DeviceStateDir.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/DeviceState/DeviceStateDir.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'DeviceStateDir.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_clDeviceStateDir_t {
    QByteArrayData data[25];
    char stringdata[224];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_clDeviceStateDir_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_clDeviceStateDir_t qt_meta_stringdata_clDeviceStateDir = {
    {
QT_MOC_LITERAL(0, 0, 16),
QT_MOC_LITERAL(1, 17, 8),
QT_MOC_LITERAL(2, 26, 0),
QT_MOC_LITERAL(3, 27, 12),
QT_MOC_LITERAL(4, 40, 4),
QT_MOC_LITERAL(5, 45, 8),
QT_MOC_LITERAL(6, 54, 6),
QT_MOC_LITERAL(7, 61, 4),
QT_MOC_LITERAL(8, 66, 3),
QT_MOC_LITERAL(9, 70, 4),
QT_MOC_LITERAL(10, 75, 17),
QT_MOC_LITERAL(11, 93, 5),
QT_MOC_LITERAL(12, 99, 10),
QT_MOC_LITERAL(13, 110, 5),
QT_MOC_LITERAL(14, 116, 7),
QT_MOC_LITERAL(15, 124, 3),
QT_MOC_LITERAL(16, 128, 4),
QT_MOC_LITERAL(17, 133, 6),
QT_MOC_LITERAL(18, 140, 13),
QT_MOC_LITERAL(19, 154, 11),
QT_MOC_LITERAL(20, 166, 8),
QT_MOC_LITERAL(21, 175, 8),
QT_MOC_LITERAL(22, 184, 11),
QT_MOC_LITERAL(23, 196, 13),
QT_MOC_LITERAL(24, 210, 12)
    },
    "clDeviceStateDir\0initTree\0\0std::wstring\0"
    "path\0addDrive\0letter\0name\0sfn\0size\0"
    "changeDriveStatus\0usage\0moveToItem\0"
    "wpath\0addItem\0dir\0date\0moveUp\0"
    "updateRequest\0moveRequest\0dst_path\0"
    "src_path\0copyRequest\0deleteRequest\0"
    "mkdirRequest\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_clDeviceStateDir[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   79,    2, 0x05,
       1,    0,   82,    2, 0x25,
       5,    4,   83,    2, 0x05,
      10,    2,   92,    2, 0x05,
      12,    1,   97,    2, 0x05,
      14,    4,  100,    2, 0x05,
      17,    0,  109,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
      18,    1,  110,    2, 0x0a,
      18,    0,  113,    2, 0x2a,
      19,    2,  114,    2, 0x0a,
      22,    2,  119,    2, 0x0a,
      23,    1,  124,    2, 0x0a,
      24,    1,  127,    2, 0x0a,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Char, 0x80000000 | 3, QMetaType::Bool, QMetaType::ULongLong,    6,    7,    8,    9,
    QMetaType::Void, QMetaType::Char, QMetaType::ULongLong,    6,   11,
    QMetaType::Void, 0x80000000 | 3,   13,
    QMetaType::Void, 0x80000000 | 3, QMetaType::ULongLong, QMetaType::Bool, QMetaType::UInt,    7,    9,   15,   16,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 3,   20,   21,
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 3,   20,   21,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,

       0        // eod
};

void clDeviceStateDir::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        clDeviceStateDir *_t = static_cast<clDeviceStateDir *>(_o);
        switch (_id) {
        case 0: _t->initTree((*reinterpret_cast< const std::wstring(*)>(_a[1]))); break;
        case 1: _t->initTree(); break;
        case 2: _t->addDrive((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< const std::wstring(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3])),(*reinterpret_cast< unsigned long long(*)>(_a[4]))); break;
        case 3: _t->changeDriveStatus((*reinterpret_cast< char(*)>(_a[1])),(*reinterpret_cast< unsigned long long(*)>(_a[2]))); break;
        case 4: _t->moveToItem((*reinterpret_cast< const std::wstring(*)>(_a[1]))); break;
        case 5: _t->addItem((*reinterpret_cast< const std::wstring(*)>(_a[1])),(*reinterpret_cast< unsigned long long(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3])),(*reinterpret_cast< uint(*)>(_a[4]))); break;
        case 6: _t->moveUp(); break;
        case 7: _t->updateRequest((*reinterpret_cast< const std::wstring(*)>(_a[1]))); break;
        case 8: _t->updateRequest(); break;
        case 9: _t->moveRequest((*reinterpret_cast< const std::wstring(*)>(_a[1])),(*reinterpret_cast< const std::wstring(*)>(_a[2]))); break;
        case 10: _t->copyRequest((*reinterpret_cast< const std::wstring(*)>(_a[1])),(*reinterpret_cast< const std::wstring(*)>(_a[2]))); break;
        case 11: _t->deleteRequest((*reinterpret_cast< const std::wstring(*)>(_a[1]))); break;
        case 12: _t->mkdirRequest((*reinterpret_cast< const std::wstring(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (clDeviceStateDir::*_t)(const std::wstring & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&clDeviceStateDir::initTree)) {
                *result = 0;
            }
        }
        {
            typedef void (clDeviceStateDir::*_t)(char , const std::wstring & , bool , unsigned long long );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&clDeviceStateDir::addDrive)) {
                *result = 2;
            }
        }
        {
            typedef void (clDeviceStateDir::*_t)(char , unsigned long long );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&clDeviceStateDir::changeDriveStatus)) {
                *result = 3;
            }
        }
        {
            typedef void (clDeviceStateDir::*_t)(const std::wstring & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&clDeviceStateDir::moveToItem)) {
                *result = 4;
            }
        }
        {
            typedef void (clDeviceStateDir::*_t)(const std::wstring & , unsigned long long , bool , unsigned int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&clDeviceStateDir::addItem)) {
                *result = 5;
            }
        }
        {
            typedef void (clDeviceStateDir::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&clDeviceStateDir::moveUp)) {
                *result = 6;
            }
        }
    }
}

const QMetaObject clDeviceStateDir::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_clDeviceStateDir.data,
      qt_meta_data_clDeviceStateDir,  qt_static_metacall, 0, 0}
};


const QMetaObject *clDeviceStateDir::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *clDeviceStateDir::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_clDeviceStateDir.stringdata))
        return static_cast<void*>(const_cast< clDeviceStateDir*>(this));
    if (!strcmp(_clname, "bsDeviceState"))
        return static_cast< bsDeviceState*>(const_cast< clDeviceStateDir*>(this));
    return QObject::qt_metacast(_clname);
}

int clDeviceStateDir::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void clDeviceStateDir::initTree(const std::wstring & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 2
void clDeviceStateDir::addDrive(char _t1, const std::wstring & _t2, bool _t3, unsigned long long _t4)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)), const_cast<void*>(reinterpret_cast<const void*>(&_t3)), const_cast<void*>(reinterpret_cast<const void*>(&_t4)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void clDeviceStateDir::changeDriveStatus(char _t1, unsigned long long _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void clDeviceStateDir::moveToItem(const std::wstring & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void clDeviceStateDir::addItem(const std::wstring & _t1, unsigned long long _t2, bool _t3, unsigned int _t4)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)), const_cast<void*>(reinterpret_cast<const void*>(&_t3)), const_cast<void*>(reinterpret_cast<const void*>(&_t4)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void clDeviceStateDir::moveUp()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}
QT_END_MOC_NAMESPACE
