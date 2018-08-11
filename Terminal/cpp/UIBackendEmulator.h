#ifndef UIBACKENDEMULATOR_H
#define UIBACKENDEMULATOR_H

#include "UIBackendTerminal.h"

class UIBackendEmulator : public UIBackendTerminal
{
public:
    UIBackendEmulator(QObject* parent = nullptr);

    bool checkPinCode(const QString &aPin) override;
    bool doPayment() override;
    bool detectCreditCard() override;
    bool requestProductPrice() override;
    bool requestProductName() override;
};

#endif // UIBACKENDEMULATOR_H
