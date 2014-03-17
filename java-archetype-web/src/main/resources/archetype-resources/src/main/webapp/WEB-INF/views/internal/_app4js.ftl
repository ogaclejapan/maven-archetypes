<#--
__/__/__/__/__/__/__/__/__/__/
__/ _app4js.ftl
__/__/__/__/__/__/__/__/__/__/

jsに引き渡す値を定義するための内部ファイル

e.g

  <#include "/internal/_app4js.ftl" />

-->

<#if !(_??) ><#assign _ = $.create(rc) /></#if>

<script type="text/javascript">
<!--

var app4js = {}

app4js.isDebug = ${_.debug()?string};
app4js.baseUrl = "${_.page()}";
app4js.assetUrl = "${_.asset()}";

<#if (__alert)?has_content >
app4js.alerts = JSON.parse('${_.jsonify(__alert)}');
</#if>

<#if (__toast)?has_content >
app4js.toasts = JSON.parse('${_.jsonify(__toast)}');
</#if>

-->
</script>
