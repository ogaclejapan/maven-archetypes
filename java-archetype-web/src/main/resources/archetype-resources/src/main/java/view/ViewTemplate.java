#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.view;

import java.io.IOException;

import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.support.RequestContext;

import ${package}.Application;
import ${package}.Application.JSON;

/**
 * テンプレートビュー内から呼び出されるビュー用メソッド群
 */
public class ViewTemplate {

	private static final String JS = ".js";
	private static final String JS_MIN = ".min" + JS;
	private static final String JS_PATH = "/js";
	private static final String CSS = ".css";
	private static final String CSS_MIN = ".min" + CSS;
	private static final String CSS_PATH = "/css";
	private static final String ASSETS_PATH = "/assets";
	
	private static final String CODE_PREFIX_LABEL = "label.";
	
	private final RequestContext rc;
	private final Application.Settings settings;
	
	/**
	 * コンストラクタ
	 * @param rc {@link RequestContext リクエストに関連する情報}
	 * @param settings {@link Application.Settings アプリケーション設定値}
	 */
	public ViewTemplate(RequestContext rc, Application.Settings settings) {
		Assert.notNull(rc);
		this.rc = rc;
		this.settings = settings;
	}
	
	/**
	 * 開発モードかどうかを判定する
	 * @return trueの場合のみ開発モードを示す
	 */
	public boolean debug() {
		return settings.isDebug();
	}
	
	/** 
	 * @return リクエストされたURI文字列を返す
	 */
	public String href() {
		return rc.getRequestUri();
	}
		
	/** 
	 * @return リクエストされたクエリ文字列を返す
	 */
	public String query() {
		return rc.getQueryString();
	}
	
	/**
	 * @return WEBアプリケーションのルートURLを返す
	 */
	public String page() {
		return getAppPath().toString();
	}
	
	/** 
	 * @param path パス文字列
	 * @return {@link ${symbol_pound}page()}に{@code path}を加えたURLを返す
	 */
	public String page(String path) {
		Assert.notNull(path);
		return getAppPath().append(path).toString();
	}
	
	/** 
	 * @return WEBアプリケーションリソースのルートURLを返す
	 */
	public String asset() {
		return getAssetPath().toString();
	}
	
	/** 
	 * @param path リソースパス文字列
	 * @return {@link ${symbol_pound}asset()}に{@code source}を加えたURLを返す
	 */
	public String asset(String source) {
		Assert.notNull(source);
		return getAssetPath().append(source).toString();
	}
	
	/** 
	 * {@link ${symbol_pound}asset(String)}に{@code '/js/${symbol_dollar}source'}を加えたURLを返す
	 * @param source jsリソースルートからのファイルパス文字列 {@code (e.g. /app.js)}
	 * @return {@code debug() == false}の場合はminify化したJavaScript拡張子({@code .min.js})に変換したURLを返す
	 */
	public String js(String source) {
		Assert.notNull(source);
		final String jsSource = (debug()) ? source : source.replace(JS, JS_MIN);
		return getAssetPath().append(JS_PATH).append(jsSource).toString();
	}
	
	/**
	 * {@link ${symbol_pound}asset(String)}に{@code '/css/${symbol_dollar}source'}を加えたURLを返す
	 * @param source cssリソースルートからのファイルパス文字列 {@code (e.g. /app.css)}
	 * @return {@code debug() == false}の場合はminify化したCss拡張子({@code .min.css})に変換したURLを返す
	 */
	public String css(String source) {
		Assert.notNull(source);
		final String cssSource = (debug()) ? source : source.replace(CSS, CSS_MIN).toString();
		return getAssetPath().append(CSS_PATH).append(cssSource).toString();
	}
	
	/**
	 * @param code ラベル用メッセージコード
	 * @return メッセージリソースから{@code 'label.${symbol_dollar}code'}に該当する文字列を返す
	 */
	public String label(String code) {
		Assert.notNull(code);
		return rc.getMessage(CODE_PREFIX_LABEL + code);
	}
	
	/** 
	 * @param code メッセージコード
	 * @return メッセージリソースから{@code '${symbol_dollar}code'}に該当する文字列を返す
	 */
	public String text(String code) {
		Assert.notNull(code);
		return rc.getMessage(code);
	}
	
	/** 
	 * @param メッセージコード
	 * @param args パラメータ付きメッセージにバインドする値
	 * @return メッセージリソースから{@code '${symbol_dollar}code'}に該当する文字列に{@code args}をバインドして返す
	 */
	public String text(String code, Object... args) {
		Assert.notNull(code);
		return rc.getMessage(code, args);
	}
	
	/**
	 * {@code debug() == true}の場合にmsgをコンソールにデバッグ表示する
	 * @param msg デバッグ文字列
	 */
	public void println(String msg) {
		if (settings.isDebug()) {
			System.out.println(msg);
		}
	}
	
	/** 
	 * @param obj JSON化可能なオブジェクト
	 * @return JSON文字列に変換した文字列を返す 
	 * @throws IOException 変換に失敗した場合にこの例外が投げられる
	 */
	public String jsonify(Object obj) throws IOException {
		return JSON.stringify(obj);
	}
	
	/** 
	 * @return 内部で扱うアプリケーションベースURLを含んだパスビルダーを返す
	 */
	protected StringBuilder getAppPath() {
		final String url = settings.getAppPath();
		return (StringUtils.hasText(url)) ? new StringBuilder(url) : new StringBuilder(rc.getContextPath());
	}
	
	/** 
	 * @return 内部で扱うアプリケーションリソースベースURLを含んだパスビルダーを返す
	 */
	protected StringBuilder getAssetPath() {
		final String url = settings.getAssetPath();
		return (StringUtils.hasText(url)) ? new StringBuilder(url) : getAppPath().append(ASSETS_PATH);
	}
	
}
