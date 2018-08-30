#ifndef CORE_H
#define CORE_H

#include <QObject>

class Core : public QObject
{
    Q_OBJECT
public:
    enum CreditCardMode{CCM_NONE,CCM_CHIP,CCM_STRIPE,CCM_NFC};
    explicit Core(QObject *parent = nullptr);

    virtual bool checkPinCode(const QString& aPinCode);
    virtual bool doPayment();
    virtual bool refreshData();
    virtual bool abortProccess();

signals:
    void signalCardModeChanged( int aMode );
    void signalCardStateChanged( const QString& aState );
    void signalProductNameChanged( const QString& aName );
    void signalProductPriceChanged( double aPrice );
    void signalError( const QString& aInformation);
    void signalAbortProcess();
};

#endif // CORE_H
