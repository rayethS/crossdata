/*
 * Licensed to STRATIO (C) under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The STRATIO (C) licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package com.stratio.crossdata.common.data;

/**
 * Connector Name class.
 */
public class ConnectorName extends FirstLevelName {

    /**
     * Serial version UID.
     */
    private static final long serialVersionUID = 4037037885060672489L;

    /**
     * Connector name.
     */
    private final String name;

    /**
     * Constructor.
     * @param connectorName Connector Name.
     */
    public ConnectorName(String connectorName) {
        super();
        this.name = connectorName;
    }

    /**
     * Get the Connector Name.
     * @return Connector Name.
     */
    public String getName() {
        return name;
    }

    /**
     * Get the qualified name of the connector.
     * @return qualified name of the connector.
     */
    public String getQualifiedName() {
        return QualifiedNames.getConnectorQualifiedName(getName());
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public NameType getType() {
        return NameType.CONNECTOR;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        if (!super.equals(o)) {
            return false;
        }

        ConnectorName that = (ConnectorName) o;

        if (name != null ? !name.equals(that.name) : that.name != null) {
            return false;
        }

        return true;
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}