#ifndef UIBACKENDTERMINAL_H
#define UIBACKENDTERMINAL_H

#include "UIBackend.h"

class UIBackendTerminal : public UIBackend
{
    Q_OBJECT

public:
    UIBackendTerminal(QObject* parent = nullptr);
    Q_INVOKABLE virtual bool checkPinCode(const QString& aPin);
    Q_INVOKABLE virtual bool doPayment();
    Q_INVOKABLE virtual bool detectCreditCard();
    Q_INVOKABLE virtual bool requestProductPrice();
    Q_INVOKABLE virtual bool requestProductName();
    Q_INVOKABLE virtual bool requestData();

    Q_PROPERTY(int cardMode READ getCardMode WRITE setCardMode NOTIFY signalCardModeChanged)
    Q_PROPERTY(QString cardState READ getCardState WRITE setCardState NOTIFY signalCardStateChanged)
    Q_PROPERTY(double productPrice READ getProductPrice WRITE setProductPrice NOTIFY signalProductPriceChanged)
    Q_PROPERTY(bool isCardPresent READ getCardPresent WRITE setCardPresent NOTIFY signalCardPresentChanged)
    Q_PROPERTY(QString productName READ getProductName WRITE setProductName NOTIFY signalProductNameChanged)

    int getCardMode() const;
    QString getCardState() const;
    double getProductPrice() const;
    bool getCardPresent() const;    
    QString getProductName() const;

public slots:
    void setCardMode(int aCardMode);
    void setCardState(QString aCardState);
    void setProductPrice(double aPrice);
    void setCardPresent(bool aIsCardPresent);
    void setProductName(QString aProductName);

signals:
    void signalCardModeChanged(int);
    void signalCardStateChanged(const QString&);
    void signalProductPriceChanged(double);
    void signalCardPresentChanged(bool);    
    void signalProductNameChanged(const QString&);

private:
    int mCardMode{0};
    QString mCardState{""};
    double mProductPrice{0.0f};
    bool mIsCardPresent{false};
    QString mProductName{""};
};

#endif // UIBACKENDTERMINAL_H
