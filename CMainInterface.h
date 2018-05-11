#ifndef CMAININTERFACE_H
#define CMAININTERFACE_H

#include <QObject>
#include <QTimer>
#include <QQueue>
#include <QtCharts/QAbstractSeries>
#include <QtCharts/QSplineSeries>
#include <QtSensors/QMagnetometer>
#include <QtSensors/QAccelerometer>
#include <QtSensors/QPressureSensor>

const qint32 MAX_QUEUE_LENGTH = 200;

using namespace QtCharts;

class CMainInterface : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal mag_x READ mag_x NOTIFY dataChanged)
    Q_PROPERTY(qreal mag_y READ mag_y NOTIFY dataChanged)
    Q_PROPERTY(qreal mag_z READ mag_z NOTIFY dataChanged)

    Q_PROPERTY(qreal acc_x READ acc_x NOTIFY dataChanged)
    Q_PROPERTY(qreal acc_y READ acc_y NOTIFY dataChanged)
    Q_PROPERTY(qreal acc_z READ acc_z NOTIFY dataChanged)

public:
    CMainInterface();
    ~CMainInterface();

    qreal mag_x() const;
    qreal mag_y() const;
    qreal mag_z() const;

    qreal acc_x() const;
    qreal acc_y() const;
    qreal acc_z() const;

    Q_INVOKABLE void    updateBarometerGraphe(QSplineSeries * series);
    Q_INVOKABLE quint32 maxHistory();

protected:
    Q_SIGNAL void dataChanged();

    Q_SLOT   void caca();
    QTimer      m_timer;

private:
    QMagnetometer m_magnetometer;
    qreal         m_mag_x{0};
    qreal         m_mag_y{0};
    qreal         m_mag_z{0};

    QAccelerometer m_accelerometer;
    qreal         m_acc_x{0};
    qreal         m_acc_y{0};
    qreal         m_acc_z{0};

    QPressureSensor m_pressureSensor;
    QQueue<qreal>   m_pressureQueue;

};

#endif // CMAININTERFACE_H
