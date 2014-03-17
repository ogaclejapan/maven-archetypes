#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package};

import java.io.File;
import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.util.Assert;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * WebアプリケーションのDI設定
 * <p>
 * {@code classpath:/settings.json}から設定値をロードする
 */
@Configuration
public class Application {

	private static final String SETTINGS_CLASSPATH = "/settings.json";

	// __/__/__/__/__/__/__/__/__/__/
	// Methods
	// __/__/__/__/__/__/__/__/__/__/

	/**
	 * {@code classpath:/settings.json}から設定値をロードする
	 * @return {@link Settings}
	 * @throws IOException
	 */
	@Bean(name = "settings")
	public Settings getSettings() throws IOException {
		final Resource json = new ClassPathResource(SETTINGS_CLASSPATH);
		return JSON.objectify(json.getFile(), SettingsHolder.class);
	}

	// __/__/__/__/__/__/__/__/__/__/
	// Types
	// __/__/__/__/__/__/__/__/__/__/

	/**
	 * {@code JSON<->Object}の相互変換ユーティリティ 
	 */
	public static class JSON {

		private static final ObjectMapper mapper;

		static {
			mapper = new ObjectMapper();
			mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			mapper.configure(JsonParser.Feature.ALLOW_COMMENTS, true); //JSON5 like
		}

		private JSON() { }
		
		/**
		 * {@code Object->JSON}に変換する
		 * 
		 * @param value
		 * @return JSON文字列
		 * @throws IOException 変換に失敗した場合
		 */
		public static String stringify(Object value) throws IOException {
			Assert.notNull(value);
			return mapper.writeValueAsString(value);
		}

		/**
		 * {@code JSON->Object}に変換する
		 * 
		 * @param json JSON文字列
		 * @param clazz 変換するクラス
		 * @return <T>
		 * @throws IOException 変換に失敗した場合
		 */
		public static <T> T objectify(String json, Class<T> clazz) throws IOException {
			Assert.hasText(json);
			return mapper.readValue(json, clazz);
		}

		/**
		 * {@code JSONファイル->Object}に変換する
		 * @param f JSONで定義されている{@link File}
		 * @param clazz 変換するクラス
		 * @return <T>
		 * @throws IOException 変換に失敗した場合
		 */
		public static <T> T objectify(File f, Class<T> clazz) throws IOException {
			Assert.notNull(f);
			return mapper.readValue(f, clazz);
		}
		
	}
	
	
	/**
	 * アプリケーションの設定値
	 */
	public static interface Settings {

		/**
		 * 開発用モードかどうかを判定する
		 * @return 開発用モードの場合のみtrue、それ以外はfalse
		 */
		boolean isDebug();

		/**
		 * WEBアプリケーションのベースURLを取得する
		 * @return 空文字の場合はアプリ内のパスがコンテキストルートからで問題なしと判断する
		 */
		String getAppPath();

		/**
		 * WEBアプリケーションリソースのベースURLを取得する
		 * @return 空文字の場合はリソース内のパスがコンテキストルートからで問題なしと判断する
		 */
		String getAssetPath();

	}

	/**
	 * アプリケーションの設定値保持クラス
	 */
	static class SettingsHolder implements Settings {

		private boolean debug = false;
		private String appPath = "";
		private String assetPath = "";

		@Override
		public boolean isDebug() {
			return debug;
		}

		@Override
		public String getAppPath() {
			return appPath;
		}

		@Override
		public String getAssetPath() {
			return assetPath;
		}

	}

}
