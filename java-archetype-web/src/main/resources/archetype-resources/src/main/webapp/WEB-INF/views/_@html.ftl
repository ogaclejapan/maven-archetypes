<#--
__/__/__/__/__/__/__/__/__/__/
__/ _@html.ftl
__/__/__/__/__/__/__/__/__/__/

Bootstrap＋jQueryをベースにしたhtmlテンプレートを自動生成するMacroファイル

e.g. 

  <#import "_@html.ftl" as html />

-->
<#assign _ = $.create(rc) />

<#assign DEFAULT_META = "/internal/_meta.ftl" />
<#assign DEFAULT_APP4JS = "/internal/_app4js.ftl" />
<#assign DEFAULT_HEADER = "/internal/_navbar.ftl" />
<#assign DEFAULT_FOOTER = "/internal/_footer.ftl" />

<#assign BOOTSTRAP_VERSION = "3.0.2" />
<#assign BOOTSTRAP_ICONS_VERSION = "3.0.0" />
<#assign JQUERY_VERSION = "2.0.3" />
<#assign TOASTR_VERSION = "2.0.1" />

<#--
__/__/__/__/__/__/__/__/__/__/
__/ page
__/__/__/__/__/__/__/__/__/__/

アプリケーションに必要なベース要素を組み込んだページ要素を自動で生成する。

※このメソッドはnestedがコンテンツレベルの要素になるので、任意のhead要素などを追加することはできない。
　ページ固有のhead要素または、body閉じタグ前にscript要素を追加したい場合は@headと@bodyを使う必要がある。

@param title : ページのtitle要素に入れる名前
@param meta : ページhead要素内に含めるmeta要素のftlをincludeする (デフォルトはDEFAULT_META変数から読み込む)
@param header : アプリ上部に表示するftlをincludeする (デフォルトはDEFAULT_HEADER変数から読み込む)
@param footer : アプリ下部に表示するftlをincludeする (デフォルトはDEFAULT_FOOTER変数から読み込む)
@param minify : 空白やタブ、改行など可能な限り取り除き、要素サイズを圧縮する (デフォルトはtrue)

@nested : コンテンツ要素を定義する領域

e.g.

  <@html.page title="Java ArcheType Web">
    <div class="container">content...</div>
  </@html.page>

-->
<#macro page title meta="${DEFAULT_META}" header="${DEFAULT_HEADER}" footer="${DEFAULT_FOOTER}" minify=true >
<@min skip=!minify >
	<!DOCTYPE html>
  <html>
  <head>
    <@head title="${title}" meta="${meta}" minify=false />
  </head>
  <body>
    <@body header="${header}" footer="${footer}" minify=false >
      <#nested />
    </@body>
  </body>
  </html>
</@min>
</#macro>


<#--
__/__/__/__/__/__/__/__/__/__/
__/ head
__/__/__/__/__/__/__/__/__/__/

アプリケーションに必要なベースhead内要素を自動で生成する。

nestedまたはMacro文の下部に任意のhead内要素を定義することが可能。
※このMacroではhead要素自体は生成されないことに注意すること。

@param title : ページのtitle要素に入れる名前
@param meta : meta要素に定義したftlをincludeする (デフォルトはDEFAULT_META変数から読み込む)
@param app4j : JavaScript側にブリッジする値を定義したftlをincludeする (デフォルトはDEFAULT_APP4JS変数から読み込む)
@param minify : 空白やタブ、改行など可能な限り取り除き、要素サイズを圧縮する (デフォルトはtrue)

@nested : 任意のhead要素を追加可能な領域

e.g.
  
  <html>
  <head>
    <@html.head title="Java ArcheType Web">
      <meta name="this.pageonly.meta" content="xxx">
    </@html.head>
    <link href="//this.pageonly.css" rel="stylesheet" media="screen">
  </head>
  <body>
    <div class="container">content...</div>
  </body>
  </html>

-->
<#macro head title meta="${DEFAULT_META}" app4js="${DEFAULT_APP4JS}" minify=true >
<@min skip=!minify >
	<#if meta?has_content>
		<#include meta />
	</#if>

  <title>${title} | ${_.label('app.name')}</title>

  <#nested /><#-- Custom Head -->

  <#-- Common CSS -->
  <link href="//netdna.bootstrapcdn.com/bootstrap/${BOOTSTRAP_VERSION}/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="//netdna.bootstrapcdn.com/bootstrap/${BOOTSTRAP_ICONS_VERSION}/css/bootstrap-glyphicons.css" rel="stylesheet" media="screen">
  <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/${TOASTR_VERSION}/css/toastr.min.css" rel="stylesheet" media="screen">
  <link href="${_.css('/app.css')}" rel="stylesheet" media="screen">

  <#if app4js?has_content>
    <#include app4js />
  </#if>
</@min>
</#macro>


<#--
__/__/__/__/__/__/__/__/__/__/
__/ body
__/__/__/__/__/__/__/__/__/__/

アプリケーションに必要なベースbody内要素を自動で生成する。

nestedまたはMacro文の下部に任意のbody内要素を定義することが可能。
※このMacroではbody要素自体は生成されないことに注意すること。

@param header : アプリ上部に表示するftlをincludeする (デフォルトはDEFAULT_HEADER変数から読み込む)
@param footer : アプリ下部に表示するftlをincludeする (デフォルトはDEFAULT_FOOTER変数から読み込む)
@param minify : 空白やタブ、改行など可能な限り取り除き、要素サイズを圧縮する (デフォルトはtrue)

@nested : ページ内コンテンツ要素を定義するための領域

e.g.

  <html>
  <head>
    <title>Java ArcheType Web</title>
  </head>
  <body>
    <@html.body>
      <div class="row">content...</div>
    </@html.body>
    <script src="//this.pageonly.js"></script>
  </body>
  </html>

-->
<#macro body header="${DEFAULT_HEADER}" footer="${DEFAULT_FOOTER}" minify=true >
<@min skip=!minify >
  <div id="contents">
    <#if header?has_content>
      <#include header />
    </#if>
  	<div class="container">
    	<#nested /><#-- Page Content -->
    </div>
  </div>
  <#if footer?has_content>
  <div id="footer">
  	<#include footer />
  </div>
  </#if>
  <#-- Common JavaScript -->
  <script src="//code.jquery.com/jquery-${JQUERY_VERSION}.min.js"></script>
  <script src="//netdna.bootstrapcdn.com/bootstrap/${BOOTSTRAP_VERSION}/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/${TOASTR_VERSION}/js/toastr.min.js"></script>
  <script src="${_.js('/app.js')}"></script>
</@min>
</#macro>


<#--
__/__/__/__/__/__/__/__/__/__/
__/ min
__/__/__/__/__/__/__/__/__/__/

囲んだ要素内のタブや半角スペース、改行を削除する。
この@htmlマクロで提供するテンプレートを使う場合は呼び出し不要。

@param skip true(デフォルトfalse)の場合のみ、何もせずスキップする。

e.g.

  <@html.min>
    <html>
      <head>
        ...
      </head>
      <body>
        ...
      </body>
    </html>
  </@html.min>

-->
<#macro min skip=false>
  <#if skip >
    <#nested>
  <#else>
    <#local is_single_line = !(_.debug()) />
    <@compress single_line=is_single_line >
      <#nested>
    </@compress> 
  </#if>
</#macro>
