<cfcomponent output="false"> 
    <cffunction name="saveUser" access="remote"  output="false" returntype="any" returnformat="JSON">  
        <cfargument name="fullName" type="string" required="yes" >
        <cfargument name="emailID"  type="string" required="yes" >
        <cfargument name="userName" type="string" required="yes" >
        <cfargument name="password" type="string" required="yes" >      
        <cfquery name="Local.saveToaddressbook" result="userResult">
            INSERT INTO addressbook
            ( 
            fullName,emailID,userName,password,userImage
            )
            VALUES 
            ( 
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fullName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.emailID#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(arguments.password)#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="" />
            )
        </cfquery>
        <cfset variables.getID = #userResult.generated_key#> 
        <cfset variables.getNumberOfRecords = listLen(#userResult.generated_key#)> 
        <cfif getNumberOfRecords GT 0>
            <cfset Session.LoggedIn = "1">
            <cfset Session.userName = "#arguments.userName#">
            <cfset Session.emailID = "#arguments.emailID#">    
            <cfset Session.userID = "#getID#">    
        </cfif>
        <cfset retVal = ArrayNew(1)/>
        <cfset temp = {} />
        <cfset temp['getNumberOfRecords']=#getNumberOfRecords#/>
        <cfset ArrayAppend(retval, temp)> 
        <cfreturn retval> 
    </cffunction>
     <!---get user list--->
    <cffunction name="getUsers" access="public" output="false" returntype="query">	
        <cfargument name="userName" type="string" required="true" />
        <cfargument name="password" type="string" required="true" /> 
        <cfquery name="local.getUsersDet">
            SELECT *
            FROM addressbook
            WHERE (userName = '#arguments.userName#' or emailID='#arguments.userName#' ) 
            AND password = '#hash(arguments.password)#'
        </cfquery>
        <cfreturn local.getUsersDet />
    </cffunction>
     <cffunction name="validateLogin"  access="public"   output="false">
        <cfargument name="userName" type="string" required="true" />
        <cfargument name="password" type="string" required="true" /> 
        <cfif  #arguments.userName# EQ  "">
            <cfset variables.result = "Enter  your Username ">
        </cfif>
        <cfif  #arguments.password# EQ "">
            <cfset variables.result =  "Enter your  password">
        </cfif>
          <cfreturn variables.result>
     </cffunction>  
</cfcomponent>    