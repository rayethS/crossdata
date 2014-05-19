/*
 * Stratio Meta
 *
 * Copyright (c) 2014, Stratio, All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.
 */

package com.stratio.meta.deep.functions;

import java.io.Serializable;
import java.util.List;

import org.apache.spark.api.java.function.Function;

import com.stratio.deep.entity.Cells;

public class In extends Function<Cells, Boolean> implements Serializable {

    /**
     * Serial version UID.
     */
    private static final long serialVersionUID = -6637139616271541577L;

    /**
     * Name of the field of the cell to compare.
     */
    private String field;

    /**
     * IDs in the IN clause.
     */
    private List<String> inIDs;

    /**
     * In apply in filter to a field in a Deep Cell.
     * 
     * @param field
     *            Name of the field to check.
     * @param inIDs
     *            List of values of the IN clause.
     */
    public In(String field, List<String> inIDs) {
        this.field = field;
        this.inIDs = inIDs;
    }

    @Override
    public Boolean call(Cells cells) {
        
        Boolean isValid = false;
        Object cellValue = cells.getCellByName(field)
                .getCellValue();
        
        String currentValue = String.valueOf(cellValue);
        if (currentValue != null) {
            isValid = inIDs.contains(currentValue);
        }

        return isValid;
    }
}