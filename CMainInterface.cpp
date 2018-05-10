#include "CMainInterface.h"

#include <QDebug>
CMainInterface::CMainInterface()
{
    connect(&m_timer, SIGNAL(timeout()), this, SLOT(caca()));
    m_timer.start(200);

    qDebug() << m_magnetometer.start();
    m_accelerometer.start();
}

CMainInterface::~CMainInterface()
{

}
qreal CMainInterface::mag_x() const
{
    return m_mag_x;
}

qreal CMainInterface::mag_y() const
{
    return m_mag_y;
}

qreal CMainInterface::mag_z() const
{
    return m_mag_z;
}

void CMainInterface::caca()
{
    QMagnetometerReading *r = m_magnetometer.reading();
    if (r)
    {
        m_mag_x = r->x();
        m_mag_y = r->y();
        m_mag_z = r->z();
    }
    else
    {
        m_mag_x = qrand()%100;
        m_mag_y = qrand()%100;
        m_mag_z = qrand()%100;
    }
    QAccelerometerReading *r1 = m_accelerometer.reading();
    if (r1)
    {
        m_acc_x = r1->x();
        m_acc_y = r1->y();
        m_acc_z = r1->z();
    }
    else
    {
        m_acc_x = qrand()%20 - 10;
        m_acc_y = qrand()%20 - 10;
        m_acc_z = qrand()%20 - 10;
    }

    Q_EMIT magnetometerChanged();
    Q_EMIT accelerometerChanged();
}

qreal CMainInterface::acc_z() const
{
    return m_acc_z;
}

qreal CMainInterface::acc_y() const
{
    return m_acc_y;
}

qreal CMainInterface::acc_x() const
{
    return m_acc_x;
}
