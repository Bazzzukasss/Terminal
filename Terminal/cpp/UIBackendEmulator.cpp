#include "UIBackendEmulator.h"
#include "UILogic.h"

UIBackendEmulator::UIBackendEmulator(QObject *parent)
    :UIBackendTerminal(parent)
{
}

bool UIBackendEmulator::isPinGood(const QString &aPin)
{
    mpUILogic->showMessage(Messenger::MT_WAITING, tr("Please, waiting.\nTransaction is in process."), 3000);
    return aPin == "1111";
}
