#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QApplication>

#include "CMainInterface.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    CMainInterface *mainInterface = new CMainInterface;

    QQmlApplicationEngine engine;

    //export des classes vers QML
    engine.rootContext()->setContextProperty("Main", mainInterface);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
