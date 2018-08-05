#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlProperty>
#include <QDebug>
#include "UILogic.h"
#include "Linguist.h"
#include "Messenger.h"

UILogic::UILogic(QQmlApplicationEngine *apEngine, QObject *parent)
    : QObject(parent)
    , mpEngine(apEngine)
    , mpMessenger (new Messenger(this))
{   
    connect(mpEngine,&QQmlApplicationEngine::objectCreated,[&](){
        mpQuickWindow = qobject_cast<QQuickWindow*>(mpEngine->rootObjects().value(0));

        initializeProperties();
        initializeConnections();
        initializeHandlers();

        emit signalUICreated();

    });

    setContextProperty("cppLinguist", Linguist::getInstance());
}

void UILogic::initializeProperties()
{
    qDebug()<< "UILogic::initializeProperties";
}

void UILogic::initializeConnections()
{
    qDebug()<< "UILogic::initializeConnections";
    connect(mpQuickWindow, SIGNAL(signalUIParameterChaged(QString, QVariant)), this, SLOT(slotUIParameterChanged(QString, QVariant)));
    connect(mpQuickWindow, SIGNAL(signalUIAction(QString, QVariant)), this, SLOT(slotUIAction(QString, QVariant)));

    connect(mpQuickWindow, SIGNAL(signalMessageAnswer(QString)), mpMessenger, SLOT(slotUserAnswerReceived(QString)));
    connect(mpMessenger, SIGNAL(signalShowMessage(QVariant, QVariant)), mpQuickWindow, SLOT(showMessage(QVariant, QVariant)));
    connect(mpMessenger, SIGNAL(signalHideMessage(QVariant)), mpQuickWindow, SLOT(hideMessage()));
}

void UILogic::initializeHandlers()
{
    qDebug()<< "UILogic::initializeHandlers";
}

void UILogic::defaultHandler(QString aParam, QVariant aValue)
{
    qDebug() << "Unhandled handler:" << aParam << aValue;
}

void UILogic::executeHandler(HandlerMap &aHandlers, QString aParam, QVariant aValue)
{
    if(aHandlers.contains(aParam))
        aHandlers[aParam](aValue);
    else
        defaultHandler(aParam,aValue);
}

//QML
QVariant UILogic::getQMLProperty(const QString &aParamID)
{
    return QQmlProperty::read(mpQuickWindow, aParamID);
}

void UILogic::setQMLProperty(const QString &aParamID, const QVariant &aValue)
{
    QQmlProperty::write(mpQuickWindow, aParamID, aValue);
}

void UILogic::setContextProperty(const QString &aName, QObject *aValue)
{
    mpEngine->rootContext()->setContextProperty(aName,aValue);
}

//Message
QString UILogic::showMessage(Messenger::MessageType aType, const QString aText, int aWaitingTime, bool isNeedToWaitAnswer)
{
    return mpMessenger->showMessage(aType,aText,aWaitingTime,isNeedToWaitAnswer);
}

QString UILogic::showMessage(const QString &aIcon, const QString aCaption, const QString &aText, const QList<MessageButton> aButtons, int aWaitingTime, bool isNeedToWaitAnswer)
{
    return mpMessenger->showMessage(aIcon,aCaption,aText,aButtons,aWaitingTime,isNeedToWaitAnswer);
}

void UILogic::hideMessage()
{
    mpMessenger->hideMessage();
}

void UILogic::slotUIParameterChanged(QString aParam, QVariant aValue)
{
    executeHandler(mParamHandlers,aParam,aValue);
}

void UILogic::slotUIAction(QString aParam, QVariant aValue)
{
    executeHandler(mActionHandlers,aParam,aValue);
}
