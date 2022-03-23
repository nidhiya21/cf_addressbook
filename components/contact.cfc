 <cfcomponent>
    <!---add new pcontactge --->
    <cffunction name="insertContact" access="remote" returnType="string" returnformat="plain" output="false">
        <cfargument name="title">
        <cfargument name="firstName">
        <cfargument name="lastName">
        <cfargument name="gender">
        <cfargument name="dob">
        <cfargument name="attachment">
        <cfargument name="address">
        <cfargument name="street">
        <cfargument name="email">
        <cfargument name="phoneNumber">
        <cfargument name="pincode">
        <cfquery name = "local.insertContactDetails" result="res">  
            insert into contact(title,firstName,lastName,gender,dob,attachment,address,email,phoneNumber,pincode)
            values(
             <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.firstName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lastName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.gender#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.dob#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.attachment#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.street#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phoneNumber#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pincode#" />
            )
        </cfquery>
        <cfset variables.cfcResults =listLen(#res.generated_key#)> 
        <cfif  variables.cfcResults NEQ 0>
            <cfset LOCAL.Response.Success = true />   
        <cfelse>
            <cfset LOCAL.Response.Success = false />             
        </cfif>
            <cfreturn LOCAL.Response>
    </cffunction>      
</cfcomponent> 
