package project.user.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoAPI20 extends DefaultApi20 implements SnsUrls {
	//private NaverAPI20 _instance;

	private KakaoAPI20() {
	}

	private static class InstanceHolder {
		private static final KakaoAPI20 INSTANCE =  new KakaoAPI20();

	}

	public static KakaoAPI20 instance() {

//		if (_instance == null) {
//			_instance new NaverAPI20();
//		} else
//			return _instance;
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
}
