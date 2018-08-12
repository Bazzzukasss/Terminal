#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlProperty>
#include <QDebug>
#include "Linguist.h"
#include "UIMessenger.h"
#include "UILogic.h"
#include "UIAssistant.h"
#include "UIBackend.h"

UILogic::UILogic(QQmlApplicationEngine *apEngine, UIAssistant *apUIAssistant, UIBackend *apUIBackend, QObject *parent)
    : QObject(parent)
    , mpEngine(apEngine)
    , mpUIAssistant(apUIAssistant)
    , mpUIBackend(apUIBackend)
    , mpMessenger (new UIMessenger(this))
{   
    connect(mpEngine,&QQmlApplicationEngine::objectCreated,[&](){
        mpQuickWindow = qobject_cast<QQuickWindow*>(mpEngine->rootObjects().value(0));

        initializeProperties();
        initializeConnections();
        initializeHandlers();

        emit signalUICreated();

    });

    setContextProperty("cppLinguist", Linguist::getInstance());

    if(mpUIBackend != nullptr)
    {
        setContextProperty("cppUIBackend", mpUIBackend);
        mpUIBackend->setUILogic(this);
    }

    if(mpUIAssistant != nullptr)
        setContextProperty("cppUIAssistant", mpUIAssistant);
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
QString UILogic::showMessage(UIMessenger::MessageType aType, const QString aText, int aWaitingTime, bool isNeedToWaitAnswer)
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
