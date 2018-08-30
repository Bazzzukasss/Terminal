#include "Core.h"

Core::Core(QObject *parent)
    : QObject(parent)
{

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
