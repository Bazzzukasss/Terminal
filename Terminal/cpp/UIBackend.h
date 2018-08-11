#ifndef UIBACKEND_H
#define UIBACKEND_H

#include <QObject>
class UILogic;
class Core;

class UIBackend: public QObject
{
    Q_OBJECT

public:
    UIBackend(Core* apCore, QObject* parent = nullptr);

    void setUILogic(UILogic* apUILogic);

    Q_INVOKABLE virtual bool checkPinCode(const QString& aPinCode);
    Q_INVOKABLE virtual bool doPayment();

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

protected:
    UILogic* mpUILogic;
    Core* mpCore;

private:
    int mCardMode{0};
    QString mCardState{""};
    double mProductPrice{0.0f};
    bool mIsCardPresent{false};
    QString mProductName{""};

    void initialize();
};

#endif // UIBACKEND_H
