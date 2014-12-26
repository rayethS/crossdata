//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.4-2 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2014.12.18 at 03:57:17 PM CET 
//


package com.stratio.crossdata.common.manifest;

import java.io.Serializable;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the generated package. 
 * <p>An ConnectorFactory allows you to programatically
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ConnectorFactory implements Serializable {

    private final static QName _Connector_QNAME = new QName("", "Connector");
    private static final long serialVersionUID = -6807718565597428825L;

    /**
     * Create a new ConnectorFactory that can be used to create new instances of schema derived classes for package: generated
     * 
     */
    public ConnectorFactory() {
    }

    /**
     * Create an instance of {@link ConnectorType }
     * 
     */
    public ConnectorType createConnectorType() {
        return new ConnectorType();
    }

    /**
     * Create an instance of {@link PropertiesType }
     * 
     */
    public PropertiesType createPropertiesType() {
        return new PropertiesType();
    }

    /**
     * Create an instance of {@link ConnectorFunctionsType }
     * 
     */
    public ConnectorFunctionsType createConnectorFunctionsType() {
        return new ConnectorFunctionsType();
    }

    /**
     * Create an instance of {@link PropertyType }
     * 
     */
    public PropertyType createPropertyType() {
        return new PropertyType();
    }

    /**
     * Create an instance of {@link FunctionType }
     * 
     */
    public FunctionType createFunctionType() {
        return new FunctionType();
    }

    /**
     * Create an instance of {@link DataStoreRefsType }
     * 
     */
    public DataStoreRefsType createDataStoreRefsType() {
        return new DataStoreRefsType();
    }

    /**
     * Create an instance of {@link ExcludeType }
     * 
     */
    public ExcludeType createExcludeType() {
        return new ExcludeType();
    }

    /**
     * Create an instance of {@link SupportedOperationsType }
     * 
     */
    public SupportedOperationsType createSupportedOperationsType() {
        return new SupportedOperationsType();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ConnectorType }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "Connector")
    public JAXBElement<ConnectorType> createConnector(ConnectorType value) {
        return new JAXBElement<ConnectorType>(_Connector_QNAME, ConnectorType.class, null, value);
    }

}
