<#assign _ = $.create(rc) />
<#import "/_@html.ftl" as html />
<@html.page title="tutorial">

<div class="row">
  <div class="col-md-10 col-md-offset-1">
    <div class="page-header">
      <h1>チュートリアル <small>for Built-In Notification</small></h1>
    </div>

		<p class="lead">
			このプロジェクトにはメッセージ通知の仕組みが予め組み込まれています。<br/>
		</p>

		<#assign is_step1 = (step1!false) />
		<#assign is_step2 = (step2!false) />
		<#assign is_step3 = (step3!false) />

		<ul class="pagination">
		  <li <#if is_step1 >class="active"</#if> >
		  	<a href="${_.page('/tutorial/step1')}">
		  		<#if is_step1 ><span class="glyphicon glyphicon-hand-right"></span> </#if>
		  		Step1
		  	</a>
		  </li>
		  <li <#if is_step2 >class="active"</#if> >
		  	<a href="${_.page('/tutorial/step2')}">
		  		<#if is_step2 ><span class="glyphicon glyphicon-hand-right"></span> </#if>
		  		Step2
		  	</a>
		  </li>
		  <li <#if is_step3 >class="active"</#if> >
		  	<a href="${_.page('/tutorial/step3')}">
		  		<#if is_step3 ><span class="glyphicon glyphicon-hand-right"></span> </#if>
		  		Step3
		  	</a>
		  </li>
		</ul>

	<#if is_step1 >

		<div id="step1">
			<p class="lead well">
				さっそくメッセージ通知を試してみましょう。<br/>
				次の入力ボックスに任意な文字列を入力して、Submitボタンを押してみてください。<br/>
			</p>
			<div id="alerts"></div>
			<div class="step-try">
				<form class="form-inline" role="form" action="${_.page('/tutorial/step1')}" method="POST">
					<div class="form-group">
						<input type="text" class="form-control" name="text" value="<#if text?has_content>${text}<#else>Hello world!</#if>">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>

		<#if text?has_content>

			<div class="step-done">
				<p class="lead">
					メッセージが入力フォームの上部に表示されましたか？
					これが<strong>alert通知</strong>と呼ぶ仕組みになります。
					alert通知は<code>&lt;div id="alerts"&gt;&lt;/div&gt;</code>を定義した箇所に表示されます。
				</p>

				<ul class="pager">
				  <li class="next">
				  	<a href="${_.page('/tutorial/step2')}">
				  		<span class="glyphicon glyphicon-thumbs-up"></span> Next
				  	</a>
				  </li>
				</ul>

			</div>
		</#if>

		</div>
	</#if>

	<#if is_step2 >
		<div id="step2">
			<p class="lead well">
				通知の方法にはもう一種類、<strong>toast通知</strong>と呼ぶ仕組みがあります。<br/>
				次の入力ボックスに任意な文字列を入力して、Submitボタンを押してみてください。<br/>
			</p>
			<div class="step-try">
				<form class="form-inline" role="form" action="${_.page('/tutorial/step2')}" method="POST">
					<div class="form-group">
						<input type="text" class="form-control" name="text" value="<#if text?has_content>${text}<#else>Hello world!</#if>">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>

		<#if text?has_content>
			<div class="step-done">
				<p class="lead">
					メッセージがページ右上部に表示されましたか？<br/>
					toast通知は一定時間が経過すると自動でフェードアウトするように設定しています。<br/>
					処理自体は<a href="http://codeseven.github.io/toastr/">Toastr</a>というJSライブラリに依存してます。
				</p>

				<ul class="pager">
				  <li class="next">
				  	<a href="${_.page('/tutorial/step3')}">
				  		<span class="glyphicon glyphicon-thumbs-up"></span> Next
				  	</a>
				  </li>
				</ul>

			</div>
		</#if>

		</div>
	</#if>

	<#if is_step3 >
		<div id="step3">
			<p class="lead well">
				メッセージ通知は複数同時に表示することもできます。<br/>
				Ajax通信でページを再ロードせず、複数のToast通知を試してみましょう。<br/>
				これまでと同様に任意な文字列を入力して、Submitボタンを続けて何度か押してみてください。<br/>
			</p>
			<div class="step-try">
				<form class="form-inline" role="form">
					<div class="form-group">
						<input type="text" class="form-control" id="text" name="text" value="<#if text?has_content>${text}<#else>Hello world!</#if>">
					</div>
					<a href="javascript:void(0)" class="btn btn-primary js_submit">Submit</a>
				</form>
			</div>
		
			<div class="step-done" style="display:none">
				<p class="lead">
					立て続けに実行しても重ならず表示することができます。<br/>
					メッセージ通知の仕組みは理解できましたか？チュートリアルの説明は以上になります。<br/>
				</p>

				<ul class="pager">
					<li class="next">
						<a href="${_.page()}">
							<span class="glyphicon glyphicon-home"></span> Back
						</a>
					</li> 
				</ul>

			</div>

		</div>
	</#if>

	</div>
</div>

</@html.page>
