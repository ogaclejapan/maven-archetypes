/*
__/__/__/__/__/__/__/__/__/__/
__/ base.js
__/__/__/__/__/__/__/__/__/__/

アプリ内共通で必要なJavaScript処理を定義する。

*/

/**
@namespace appjs
**/
this.appjs = this.appjs || {};

/**
アプリケーションが開発モードの場合のみcallbackを呼び出す。

@mehtod debug
@param callback {Function} 開発モードの場合に呼び出す関数 
**/
appjs.debug = function(callback) {
	if (app4js.isDebug) {
		callback();
	}
}

/**
アプリ内のURLを返す。

@method path
@param source {String} パス文字列
@return {String} ベースURLにsourceに加えたURL
**/
appjs.path = function(source) {
	return app4js.baseUrl + source;
};


/**
アプリ内のリソースURLを返す。

@method asset
@param source {String} パス文字列
@return {String} ベースリソースURLにsourceに加えたURL
**/
appjs.asset = function(source) {
	return app4js.asset + source;
};


/**
id属性がalertsと一致する要素内にメッセージを表示する。

@method alerts
@param alertArray 
**/
appjs.alerts = function(alertArray) {

	var $alerts = $('#alerts');
	if ($alerts) {

		var html = '';
		for (var i = 0, len = alertArray.length; i < len; i++) {
			var alert = alertArray[i];
			html += '<div class="alert alert-' + alert.type + ' alert-dismissable fade in">';
			html += '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
			if (alert.title) {
				html += '<h4>' + alert.title + '</h4> ';
			}
			if (alert.message) {
				html += '<p>' + alert.message + '</p>';
			}
			html += '</div>'; 
		}

		if (html) {
			$alerts.append(html);
		}

	}

};


/**
ページ右上部に数秒間で消えるポップアップメッセージを表示する。

@method toasts
@param toastArray 
**/
appjs.toasts = function(toastArray) {

	var _showToast = function(type, message, title) {
		toastr.options = {
			"closeButton": false,
			"positionClass": "toast-top-right",
			"timeOut": "3000",
			"extendedTimeOut": "1000"
		};

		toastr[type](message, title);
	};

	for (var i = 0, len = toastArray.length; i < len; i++) {
		var toast = toastArray[i];
		_showToast(toast.type, toast.message, toast.title);
	}

};


/**
APIレスポンス結果に通知メッセージがあれば表示する。

@method notices
@param json {JSON} アプリのAPIから返却されたJSON
@param callback {Function} 処理完了後このコールバックを呼び出す
**/
appjs.notices = function(json, callback) {

	if (json.__toast) {
		appjs.toasts(json.__toast);
	}

	if (json.__alert) {
		appjs.alerts(json.__alert);
	}

	if (callback) {
		callback();
	}

};

;(function($, window) {	

	//Hack for IE
	if (typeof window.console === 'undefined') {
		window.console = {};
	}

	var document = window.document;
	$(document).ready(function() {

		if (app4js.alerts) {
			appjs.alerts(app4js.alerts);
		}

	});

	window.onload = function() {

		if (app4js.toasts) {
			appjs.toasts(app4js.toasts);
		}

	};

}(jQuery, window));
