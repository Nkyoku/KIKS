/****************************************************************************
** Meta object code from reading C++ file 'DeviceStateFile.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Source/DeviceState/DeviceStateFile.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'DeviceStateFile.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_clDeviceStateFile_t {
    QByteArrayData data[6];
    char stringdata[55];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_clDeviceStateFile_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_clDeviceStateFile_t qt_meta_stringdata_clDeviceStateFile = {
    {
QT_MOC_LITERAL(0, 0, 17),
QT_MOC_LITERAL(1, 18, 10),
QT_MOC_LITERAL(2, 29, 0),
QT_MOC_LITERAL(3, 30, 13),
QT_MOC_LITERAL(4, 44, 4),
QT_MOC_LITERAL(5, 49, 4)
    },
    "clDeviceStateFile\0changeFile\0\0"
    "std::wstring*\0path\0size\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_clDeviceStateFile[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   19,    2, 0x05,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3, QMetaType::ULongLong,    4,    5,

       0        // eod
};

void clDeviceStateFile::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        clDeviceStateFile *_t = static_cast<clDeviceStateFile *>(_o);
        switch (_id) {
        case 0: _t->changeFile((*reinterpret_cast< std::wstring*(*)>(_a[1])),(*reinterpret_cast< unsigned long long(*)>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (clDeviceStateFile::*_t)(std::wstring * , unsigned long long );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&clDeviceStateFile::changeFile)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject clDeviceStateFile::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_clDeviceStateFile.data,
      qt_meta_data_clDeviceStateFile,  qt_static_metacall, 0, 0}
};


const QMetaObject *clDeviceStateFile::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *clDeviceStateFile::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_clDeviceStateFile.stringdata))
        return static_cast<void*>(const_cast< clDeviceStateFile*>(this));
    if (!strcmp(_clname, "bsDeviceState"))
        return static_cast< bsDeviceState*>(const_cast< clDeviceStateFile*>(this));
    return QObject::qt_metacast(_clname);
}

int clDeviceStateFile::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void clDeviceStateFile::changeFile(std::wstring * _t1, unsigned long long _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
