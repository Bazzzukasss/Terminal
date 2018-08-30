#ifndef COREEMULATOR_H
#define COREEMULATOR_H

#include "Core.h"

class CoreEmulator : public Core
{
    Q_OBJECT
public:
    CoreEmulator(QObject* parent = nullptr);

    bool checkPinCode(const QString &aPinCode) override;
    bool doPayment() override;
    bool refreshData() override;

private:
    QString mCorrectPinCode;
    bool proccessEmulation(int aTime = 1500);
    bool mIsProccessing;
};

#endif // COREEMULATOR_H
