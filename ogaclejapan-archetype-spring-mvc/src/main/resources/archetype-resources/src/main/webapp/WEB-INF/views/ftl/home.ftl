<#import "spring.ftl" as spring />
<html>
<head>
	<META http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>home</title>
</head>
<body>
<div class="container">  
	<h1>
		<@spring.message "welcome.title" />
	</h1>
	<ul>
		<li><a href="hello">Hello</a></li>
	</ul>
</div>
</body>
</html>
