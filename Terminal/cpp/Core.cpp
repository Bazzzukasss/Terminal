#include "Core.h"
#include <QSocketNotifier>
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
        QSocketNotifier *gpio_notifier;

        gpio_value.setFileName(mPathToCardGPIO);
        gpio_value.open(QFile::ReadOnly);

        gpio_notifier = new QSocketNotifier(gpio_value.handle(), QSocketNotifier::Exception, this);
        gpio_notifier->setEnabled(true);
        connect(gpio_notifier, SIGNAL(activated(int)), this, SLOT(slotCardPresentChanged(int)));
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

void Core::slotCardPresentChanged(int fd)
{
    if (gpio_value.isOpen())
    {
        gpio_value.seek(0);
        emit signalCardPresentChanged(!!gpio_value.readAll().trimmed().toInt());
    }
}
