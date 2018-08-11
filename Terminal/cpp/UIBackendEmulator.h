#ifndef UIBACKENDEMULATOR_H
#define UIBACKENDEMULATOR_H

#include "UIBackendTerminal.h"

class UIBackendEmulator : public UIBackendTerminal
{
public:
    UIBackendEmulator(QObject* parent = nullptr);

    bool isPinGood(const QString &aPin);
};

#endif // UIBACKENDEMULATOR_H
