#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include "Linguist.h"
#include "UILogic.h"
#include "UIBackend.h"
#include "UIAssistant.h"
#include "Core.h"
#include "CoreEmulator.h"
#include "VideoPlayer.h"

#define EMULATION

void InitializeLinguist(QTranslator* translator)
{
    Linguist::getInstance()->setTranslator(translator);
    Linguist::getInstance()->addLanguage(LanguageData({ "English",      ":/terminal_en_US.qm", "en_US", ":/img/flags/United-States.png" }));
    Linguist::getInstance()->addLanguage(LanguageData({ "Ukrainian",    ":/terminal_uk_UA.qm", "uk_UA", ":/img/flags/Ukrain.png" }));
    Linguist::getInstance()->addLanguage(LanguageData({ "Russian",      ":/terminal_ru_RU.qm", "ru_RU", ":/img/flags/Russian.png" }));
    Linguist::getInstance()->setCurrentLanguage();
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QFontDatabase fontDB;
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Bold.ttf");
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Black.ttf");
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Regular.ttf");
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Thin.ttf");

    //QTranslator translator;
    //InitializeLinguist(&translator);

#ifdef EMULATION
    auto core = new CoreEmulator(&app);
#else
    auto core = new Core(&app);
#endif

    VideoPlayer uiPlayer;
    uiPlayer.setGeometry(0,0,272,480);
    uiPlayer.setWindowFlags(Qt::FramelessWindowHint);
    auto uiBackend = new UIBackend(core,&app);
    auto uiAssistant = new UIAssistant(&app);
    UILogic uiLogic(&engine,&uiPlayer,uiAssistant,uiBackend);

    qmlRegisterSingletonType(QUrl(QLatin1String("qrc:/qml/TStyle.qml")), "CustomControls", 1, 0, "MyStyle");
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    uiPlayer.show();
    return app.exec();
}
