<#--
__/__/__/__/__/__/__/__/__/__/
__/ _navber.ftl
__/__/__/__/__/__/__/__/__/__/

アプリケーション内の上部に固定表示する共通ナビゲーションを定義するファイル

e.g.

  <#include "/internal/_navber.ftl" />

-->

<#if !(_??) ><#assign _ = $.create(rc) /></#if>

<#--
<nav class="navbar navbar-inverse" role="navigation">
-->
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#app-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${_.page('/')}">
        ${_.label('nav.brand')}
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="app-navbar-collapse">
      <#if _.debug() >
      <ul class="nav navbar-nav">
        <li><a href="${_.page('/about')}">${_.label('nav.about')}</a></li>
      </ul>
      </#if>
    </div><!-- /.navbar-collapse -->
  </div>
</nav>


