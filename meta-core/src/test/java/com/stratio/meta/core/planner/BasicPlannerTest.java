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

package com.stratio.meta.core.planner;

import com.stratio.meta.common.result.Result;
import com.stratio.meta.core.cassandra.BasicCoreCassandraTest;
import com.stratio.meta.core.metadata.MetadataManager;
import com.stratio.meta.core.statements.MetaStatement;
import com.stratio.meta.core.utils.Tree;
import org.testng.annotations.BeforeClass;

import static org.testng.Assert.*;

public class BasicPlannerTest extends BasicCoreCassandraTest{

    protected static MetadataManager _metadataManager = null;

    protected MetaStatement stmt;

    @BeforeClass
    public static void setUpBeforeClass(){
        BasicCoreCassandraTest.setUpBeforeClass();
        BasicCoreCassandraTest.loadTestData("demo", "demoKeyspace.cql");
        _metadataManager = new MetadataManager(_session);
        _metadataManager.loadMetadata();
    }

    public void validateOk(String inputText, String methodName){
        stmt.getPlan(_metadataManager,"demo");
        Result result = stmt.validate(_metadataManager, "");
        assertNotNull(result, "Sentence validation not supported - " + methodName);
        assertFalse(result.hasError(), "Cannot validate sentence - " + methodName + ": " + result.getErrorMessage());
    }

    public void validateFail(String inputText, String methodName){
        Tree tree = stmt.getPlan(_metadataManager,"demo");
        assertTrue(tree.isEmpty(), "Sentence planification not supported - " + methodName);
    }
}
