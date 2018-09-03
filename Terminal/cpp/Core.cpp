#include "Core.h"
#include "QFileSystemWatcher"
#include <QSettings>
#include <QDebug>
#include <QFile>

Core::Core(QObject *parent)
    : QObject(parent)
{
    mSettings = new QSettings("config.ini",QSettings::IniFormat,this);
    mPathToCardGPIO = mSettings->value("pathToCardGPIO","").toString();

    if(!mPathToCardGPIO.isEmpty())
    {
        auto fileWatcher = new QFileSystemWatcher({mPathToCardGPIO},this);
        connect(fileWatcher, &QFileSystemWatcher::fileChanged, this, &Core::slotCardPresentChanged);
    }
}

bool Core::checkPinCode(const QString&)
{
    return false;
}

bool Core::doPayment()
{
    return false;
}

bool Core::refreshData()
{
    return false;
}

bool Core::abortProccess()
{
    emit signalAbortProcess();
    return false;
}

void Core::slotCardPresentChanged(const QString& aPath)
{
    QFile f(aPath);
    if (f.open(QFile::ReadOnly))
    {
        QTextStream in(&f);
        emit signalCardPresentChanged( in.readAll().toInt() == 1 );
    }
}
