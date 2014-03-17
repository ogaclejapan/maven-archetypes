#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.view;

import org.springframework.web.servlet.support.RequestContext;

import ${package}.Application;

/**
 * {@link ViewTemplate}をビューテンプレート内で生成可能にするためのファクトリークラス
 */
public class ViewTemplateFactory {

	private final Application.Settings settings;

	/**
	 * コンストラクタ
	 * 
	 * @param settings {@link Application.Settings アプリケーション設定値}
	 */
	public ViewTemplateFactory(Application.Settings settings) {
		this.settings = settings;
	}

	/**
	 * {@link ViewTemplate}を生成する
	 * <p>
	 * このメソッドをビュー内から呼び出せるようにするには、
	 * ビュー内で{@link RequestContext}を取得可能な状態にするSpringのビューに関する設定値に変更が必要である
	 * <p>
	 * {@code <property name="requestContextAttribute" value="rc" /> }
	 * 
	 * @param rc {@link RequestContext リクエストに関連する情報}
	 * @return {@link ViewTemplate}
	 */
	public ViewTemplate create(RequestContext rc) {
		return new ViewTemplate(rc, settings);
	}

}
