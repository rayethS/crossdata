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

package com.stratio.meta.core.utils;

import com.stratio.meta.common.result.QueryResult;
import com.stratio.meta.common.result.Result;
import com.stratio.meta.core.statements.MetaStatement;

public class MetaQuery {
    
    private String query;
    private QueryStatus status;
    private boolean hasError = false;
    private MetaStatement statement;
    private Tree plan;
    private Result result;
    private String targetKeyspace;
    
    public MetaQuery() {
        status = QueryStatus.NONE;
        result = QueryResult.createSuccessQueryResult();
    }
    
    public MetaQuery(String query) {
        this();
        this.query = query;
    }

    public String getQuery() {
        return query;
    }
    
    public void setQuery(String query) {
        this.query = query;
    }

    public QueryStatus getStatus() {
        return status;
    }

    public void setStatus(QueryStatus status) {
        this.status = status;
    }        
    
    public boolean hasError() {
        return hasError;
    }
    
    public void setError(){
        hasError = true;
    }
    
    public void setErrorMessage(String errorMsg) {
        hasError = true;
        result=QueryResult.createFailQueryResult(errorMsg);
    }
    
    public void setStatement(MetaStatement statement) {
        this.statement = statement;
    }    
    
    public MetaStatement getStatement() {
        return statement;
    } 
    
    public Tree getPlan() {
        return plan;
    }

    public void setPlan(Tree plan) {
        this.plan = plan;
    }
    
    public void setResult(Result result) {
        this.result = result;
        this.hasError = result.hasError();
    }

    public Result getResult() {
        return result;
    }

    public String getTargetKeyspace() {
        return targetKeyspace;
    }

    public void setSessionKeyspace(String targetKeyspace) {
        this.targetKeyspace = targetKeyspace;
        statement.setSessionKeyspace(targetKeyspace);
    }
}
