#include "Messenger.h"


#include <QEventLoop>
#include <QTimer>
#include <QDebug>

MessageButton ButtonOk      = {"Ok","Ok",MessageButton::BT_STANDART,""};
MessageButton ButtonYes     = {"Yes","Yes",MessageButton::BT_STANDART,""};
MessageButton ButtonNo      = {"No","No",MessageButton::BT_STANDART,""};
MessageButton ButtonCancel  = {"Cancel","No",MessageButton::BT_HIGHLITED,""};
MessageButton ButtonApply   = {"Apply","Yes",MessageButton::BT_STANDART,""};
MessageButton ButtonStop    = {"Stop","Ok",MessageButton::BT_HIGHLITED,"actionPlatformStop"};
MessageButton ButtonStopPlatform    = {"Stop","Ok",MessageButton::BT_HIGHLITED,"actionPlatformStop"};
MessageButton ButtonStopMovement    = {"Stop","Ok",MessageButton::BT_HIGHLITED,"actionStopMovement"};

Messenger::Messenger(QObject* parent /*= 0*/) 
	: QObject(parent)
	, mUserAnswer("")
    , mSourcePath("qrc:/img/")
{
    mTimer.setSingleShot(true);
    QObject::connect(&mTimer, &QTimer::timeout, [&](){
                                                        mLoop.quit();
                                                        emit signalHideMessage(QVariant());
                                                    });

    QObject::connect(this, static_cast<void (Messenger::*)(QPrivateSignal)>(&Messenger::signalHideMessage), &mLoop, &QEventLoop::quit);
}

QString Messenger::showMessage(MessageType aType, const QString aText, int aShowingTime /*= -1*/, bool aIsNeedToWaitAnswer)
{
    QString icons[] = { mSourcePath+"message-info.svg",
                        mSourcePath+"message-warning.svg",
                        mSourcePath+"message-request.svg",
                        mSourcePath+"message-spinner.gif",
                        mSourcePath+"message-error.svg",
                        mSourcePath+"message-warning.svg",
                        mSourcePath+"message-done.svg"
                        };

    QString captions[] = {  tr("Information"),
                            tr("Warning"),
                            tr("Request"),
                            tr("Processing..."),
                            tr("Error"),
                            tr("Information"),
                            tr("Welldone")
                            };

    QList<MessageButton> buttons[] = {
        {ButtonOk},
        {ButtonCancel,ButtonOk},
        {ButtonCancel,ButtonOk},
        {ButtonStop},
        {ButtonCancel,ButtonOk},
        {ButtonOk},
        {ButtonCancel,ButtonApply}
    };

    return showMessage(icons[aType],captions[aType], aText, buttons[aType], aShowingTime, aIsNeedToWaitAnswer);
}

QString Messenger::showMessage(const QString &aIcon, const QString aCaption, const QString &aText, const QList<MessageButton> aButtons, int aShowingTime /*= -1*/, bool aIsNeedToWaitAnswer)
{
    QVariantMap dataMap;
    QVariantList buttonsList;

    dataMap["icon"] = aIcon;
    dataMap["caption"] = aCaption;
    dataMap["text"] = aText;

    for(auto& button : aButtons)
    {
        QVariantMap buttonMap;
        buttonMap["caption"] = button.mCaption;
        buttonMap["mode"] = button.mMode;
        buttonMap["action"] = button.mAction;
        buttonMap["key"] = button.mKey;
        buttonsList << buttonMap;
    }

    emit signalShowMessage(dataMap,buttonsList);

    qDebug() << "SHOW MESSAGE: " << aIcon << aCaption << aText;
    return waitMessageAnswer(aShowingTime,aIsNeedToWaitAnswer);
}

QString Messenger::waitMessageAnswer(int aShowingTime, bool aIsNeedToWaitAnswer)
{
    if (aShowingTime > 0)
        mTimer.start(aShowingTime);

    if(aIsNeedToWaitAnswer)
    {
        mLoop.exec();
        qDebug() << "HIDE MESSAGE: ANSWER:" << mUserAnswer;
        return mUserAnswer;
    }
    return "";
}

void Messenger::hideMessage()
{
    emit signalHideMessage(QPrivateSignal());
    emit signalHideMessage(QVariant());
}

QMessageBox::StandardButton Messenger::getUserButton() const
{
    if (mUserAnswer == "Yes") return QMessageBox::Yes;
    if (mUserAnswer == "No") return QMessageBox::No;
    if (mUserAnswer == "Ok") return QMessageBox::Ok;

    return QMessageBox::Ok;
}

void Messenger::setSourcePath(QString &mPath)
{
    mSourcePath = mPath;
}

void Messenger::slotUserAnswerReceived(const QString& aAnswer)
{
    mUserAnswer = aAnswer;
    hideMessage();
}
