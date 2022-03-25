 <cfcomponent>
    <cffunction name = "uploadfile" returnType = "any"  access = "public">
        <cfset variables.validMimeTypes =  {
                                        'image/jpeg': {extension: 'jpg'}
                                ,'image/png': {extension: 'png'},'image/jpg': {extension: 'jpg'}
                                            } />
        <cfset variables.thisPath=expandPath('.') & '/contactimages/'>
        <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath)>
        <cftry>
            <cffile action="upload" filefield="attachment" destination="#variables.f_dir#" mode="777"
                accept="#StructKeyList(variables.validMimeTypes)#" strict="true" result="uploadResult"
                nameconflict="makeunique">
            <cfcatch type="any">
                <cfif FindNoCase( "No data was received in the uploaded" , cfcatch.message )>
                        <cfabort showerror="Zero length file">
                <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                        <cfabort showerror="Invalid file type">
                <cfelseif FindNoCase( "did not contain a file." , cfcatch.message )>
                        <cfabort showerror="Empty form field">
                <cfelse>
                        <cfabort showerror="Unhandled File Upload Error">
                </cfif>
            </cfcatch>
        </cftry>
        <cfreturn uploadResult>
    </cffunction> 
    <!---add new pcontactge --->
    <cffunction name="insertContact" access="remote"  output="yes">
        <cfargument name="userID" ype="numeric">
        <cfargument name="title" type="string">
        <cfargument name="firstName" type="string">
        <cfargument name="lastName" type="string">
        <cfargument name="gender" type="string">
        <cfargument name="dob" type="string">
        <cfargument name="attachment" type="string">
        <cfargument name="address" type="string">
        <cfargument name="street" type="string">
        <cfargument name="email" type="string">
        <cfargument name="phoneNumber" type="string">
        <cfargument name="pincode" ype="numeric">
        <cfquery name = "local.insertContactDetails" result="res">  
            insert into contact(userID,title,firstName,lastName,gender,dob,attachment,address,street,email,phoneNumber,pincode)
            values(
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.firstName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lastName#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.gender#" />
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#arguments.dob#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.attachment#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.street#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" />
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phoneNumber#" />
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pincode#" />
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
        <!---get contacts --->
    <cffunction name="getContacts" access="public" output="false" >	 
    <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "local.contactList"> 
            SELECT *
            FROM contact
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
        </cfquery>
        <cfreturn local.contactList/>  
    </cffunction>   
       <!---delete contacts --->
    <cffunction name="deleteContact" access="remote" returntype="struct" returnformat="json"  output="false">
        <cfargument name="contactID" type="any" required="true">		     
            <cfquery name="local.deleteuserDet" result="deleteResult">
                delete from contact  where contactID=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.contactID#">
            </cfquery>
            <cfset variables.cfcResults = deleteResult.recordcount>
            <cfif  variables.cfcResults NEQ 0>
                <cfset LOCAL.Response.Success = true />   
            <cfelse> 
                <cfset LOCAL.Response.Success = false />            
            </cfif>
                <cfreturn LOCAL.Response>
    </cffunction>  
        <!---get contacts by id--->
    <cffunction name="getContactsByID" access="remote"  output="false"  returntype="any" returnformat="JSON" >   	 
        <cfargument name="contactID" type="numeric" required="yes" > 
            <cfset retVal = ArrayNew(1)>
            <cfquery name = "contactDetails"> 
                SELECT *
                FROM contact
                where contactID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactID#">
            </cfquery>
             <cfloop query="contactDetails">
                <cfset temp = {} />
                <cfset temp['firstName']=contactDetails.firstName />
                <cfset temp['lastName']=contactDetails.lastName />
                <cfset ArrayAppend(retval, temp)>
                </cfloop>
                <cfreturn retVal> 
    </cffunction>  
        <!---get excel--->
    <cffunction name="getExcel" access="remote"  output="false"  >   	 
        <cfargument name="userID" type="numeric" required="yes" > 
            <cfquery name="local.getExcel"  >
                SELECT *
                FROM contact
                where userID =<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
            </cfquery>
            <cfset thisPath = ExpandPath("*.*")>
            <cfset f_dir = GetDirectoryFromPath(thisPath)>
            <cfset f_name = "#dateformat(now(), 'mmddyy')##timeformat(now(), 'hhmm')#.csv">
            <cffile action="WRITE" file="#f_dir##f_name#"
            output="Title, Name,Phone, Contact Email,Gender,DOB,Address,Street,Pincode" addnewline="Yes">  
            <cfloop query="getExcel">
                <cffile action="APPEND" file="#f_dir##f_name#"
                output="#title#, #firstName# #lastName#, #phoneNumber#, #email#, #gender#,#dob#,#address#,#street#,#pincode#"
                addnewline="Yes">
            </cfloop>
            <br>
            <cfset local.theLink = "/cf_addressbook/" & f_name>
            <cfreturn local.theLink/>   
    </cffunction> 
      <!---get pdf--->
    <cffunction name="getPdf" access="remote"  output="false"  >   	 
        <cfargument name="userID" type="numeric" required="yes" > 
            <cfquery name = "local.pdfData"> 
                SELECT *
                FROM contact
                where userID =<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#">
            </cfquery>
            <cfreturn local.pdfData/>   
    </cffunction>  
</cfcomponent> 
