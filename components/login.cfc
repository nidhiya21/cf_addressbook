<cfcomponent output="false"> 
    <cffunction name="saveUser" access="public">
        <cfargument name="fullName" type="string" required="yes" >
        <cfargument name="emailID"  type="string" required="yes" >
        <cfargument name="userName" type="string" required="yes" >
        <cfargument name="password" type="string" required="yes" >
        <cfquery name="Local.saveToaddressbook" result="userResult">
            INSERT INTO addressbook
            ( 
            fullName,emailID,userName,password
            )
            VALUES 
            ( 
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fullName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.emailID#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.password#" />
            )
        </cfquery>
        <cfset variables.getNumberOfRecords = listLen(#userResult.generated_key#)> 
        <cfreturn variables.getNumberOfRecords>
    </cffunction>
     <!---get user list--->
    <cffunction name="getUsers" access="public" output="false" returntype="query">	
        <cfargument name="userName" type="string" required="true" />
        <cfargument name="password" type="string" required="true" /> 
        <cfquery name="local.getUsersDet">
            SELECT *
            FROM addressbook
            WHERE userName = '#arguments.userName#' 
            AND password = '#arguments.password#'
        </cfquery>
        <cfreturn local.getUsersDet />
    </cffunction>
</cfcomponent>    