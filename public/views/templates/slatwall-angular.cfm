

<html lang="en">
	<head>
		
		
		<cfoutput>
		    <script>
		        var hibachiConfig = {
		            action:'slatAction',
		            basePartialsPath: 'custom/client/src/'
		        };
		    </script>
		</cfoutput>
		<script type="text/javascript" src="/org/Hibachi/HibachiAssets/js/jquery-1.7.1.min.js"></script>
	</head>
	<body ng-cloak>
		<!---<swf-directive partial-path="{{customTemplateFolder}}" partial-name="createaccountpartial"></swf-directive>--->
		<swf-directive partial-path="/public/views/templates/partials/" partial-name="login"></swf-directive>
	</body>
	<script type="text/javascript"  src="/org/Hibachi/client/src/slatwall_frontend.js"></script>
</html>