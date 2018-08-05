#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include "Linguist.h"
#include "UILogic.h"

void InitializeLinguist(QTranslator* translator)
{
    Linguist::getInstance()->setTranslator(translator);
    Linguist::getInstance()->addLanguage(LanguageData({ "English", ":/terminal_en_US.qm", "en_US",":/img/flags/United-States.png" }));
    Linguist::getInstance()->setCurrentLanguage();
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QFontDatabase fontDB;
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Bold.ttf");

    QTranslator translator;
    InitializeLinguist(&translator);

    auto uiLogic = new UILogic(&engine);

    qmlRegisterSingletonType(QUrl(QLatin1String("qrc:/qml/TStyle.qml")), "CustomControls", 1, 0, "MyStyle");
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
