#include "soapaction.h"

SoapAction::SoapAction(QString serviceType, QString actionName, QObject *parent):
    QObject(parent),
    m_valid(true),
    m_serviceType(serviceType),
    m_actionName(actionName)
{
    m_xml.appendChild(m_xml.createProcessingInstruction("xml", "version=\"1.0\""));

    QDomElement envelope = m_xml.createElementNS("http://schemas.xmlsoap.org/soap/envelope/", "s:Envelope");
    envelope.setAttribute("s:encodingStyle", "http://schemas.xmlsoap.org/soap/encoding/");
    m_xml.appendChild(envelope);

    QDomElement body = m_xml.createElement("s:Body");
    envelope.appendChild(body);

    m_xmlAction = m_xml.createElementNS(serviceType, "u:"+actionName);
    body.appendChild(m_xmlAction);
}

SoapAction::SoapAction(QByteArray data, QObject *parent):
    QObject(parent),
    m_valid(false)
{    
    if (m_xml.setContent(data, true))
    {
        QDomElement root = m_xml.documentElement();
        if (root.localName() == "Envelope")
        {
            QDomNode body = root.firstChild();
            if (body.localName() == "Body")
            {
                m_xmlAction = body.firstChildElement();

                m_actionName = m_xmlAction.localName();

                m_serviceType = m_xmlAction.namespaceURI();

                if (!m_actionName.isEmpty() && !m_serviceType.isEmpty())
                    m_valid = true;

            }
            else
            {
                qCritical() << "invalid format, Body expected" << body.nodeName();
            }
        }
        else
        {
            qCritical() << "invalid format, Envelope expected" << root.nodeName();
        }
    }
}

bool SoapAction::isValid() const
{
    return m_valid;
}

QString SoapAction::serviceType() const
{
    return m_serviceType;
}

QString SoapAction::actionName() const
{
    return m_actionName;
}

QByteArray SoapAction::soapaction() const
{
    return QString("\"%1#%2\"").arg(serviceType()).arg(actionName()).toUtf8();
}

bool SoapAction::addArgument(const QString &name, const QString &value)
{
    if (!m_xmlAction.elementsByTagName(name).isEmpty())
    {
        qCritical() << "argument" << name << "already exists.";
        return false;
    }
    else
    {
        QDomElement arg = m_xml.createElement(name);
        arg.appendChild(m_xml.createTextNode(value));
        m_xmlAction.appendChild(arg);
        return true;
    }
}

QString SoapAction::argumentValue(const QString &param)
{
    QDomNodeList l_arg = m_xmlAction.elementsByTagName(param);
    if (l_arg.size() == 1)
        return l_arg.at(0).firstChild().nodeValue();
    else
        return QString();
}

QByteArray SoapAction::toByteArray() const
{
    return m_xml.toByteArray(-1);
}
