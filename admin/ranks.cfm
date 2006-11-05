<cfsetting enablecfoutputonly=true>
<!---
	Name         : ranks.cfm
	Author       : Raymond Camden 
	Created      : August 28, 2005
	Last Updated : 
	History      : 
	Purpose		 : 
--->

<cfmodule template="../tags/layout.cfm" templatename="admin" title="Rank Editor">

<!--- handle deletions --->
<cfif isDefined("form.mark") and len(form.mark)>
	<cfloop index="id" list="#form.mark#">
		<cfset application.rank.deleteRank(id)>
	</cfloop>
	<cfoutput>
	<p>
	<b>Rank(s) deleted.</b>
	</p>
	</cfoutput>
</cfif>

<!--- get conferences --->
<cfset ranks = application.rank.getRanks()>

<cfmodule template="../tags/datatable.cfm" 
		  data="#ranks#" list="name,minposts" 
		  editlink="ranks_edit.cfm" linkcol="name" label="Rank" />


</cfmodule>

<cfsetting enablecfoutputonly=false>