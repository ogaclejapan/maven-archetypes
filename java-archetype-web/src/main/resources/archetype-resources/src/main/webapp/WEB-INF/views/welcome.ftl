<#assign _ = $.create(rc) />
<#import "/_@html.ftl" as html />
<@html.page title="welcome">

<div class="row">
  <div class="col-md-10 col-md-offset-1">
    <div class="page-header">
      <h1>Getting started</h1>
    </div>

    <ul>
      <li><h3><a href="${_.page('/tutorial/step1')}">チュートリアル</a> <small>for Built-In Notification</small></h3></li>
    </ul>

	</div>
</div>

</@html.page>
