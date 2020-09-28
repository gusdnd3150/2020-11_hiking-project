package project.user.auth;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.codehaus.plexus.util.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;

	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());

		this.sns = sns;
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public String getGoogleAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public Map<String, Object> getUserProfile(String code) throws Exception {
		System.out.println("엑세스 토큰 받기!");
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("엑세스 토큰 받기!");
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		System.out.println("엑세스 토큰 받기!");
		oauthService.signRequest(accessToken, request);
		System.out.println("엑세스 토큰 잘 보냈니?!");

		Response response = oauthService.execute(request);
		System.out.println("다시 잘 받아 왔니?");
		return parseJson(response.getBody());

	}

	private Map<String, Object> parseJson(String body) throws Exception {
		Map<String, Object> snsMap = new HashMap();
		System.out.println("====================\n" + body + "\n===============");

		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);

		if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			snsMap.put("id", resNode.get("id").asText());
			snsMap.put("name", resNode.get("name").asText());
			snsMap.put("email", resNode.get("email").asText());

			System.out.println("====================\n" + snsMap + "\n===============");
		} else if (this.sns.isGoogle()) {
			snsMap.put("id", rootNode.get("id").asText());
			JsonNode nameNode = rootNode.path("name");
			String uname = nameNode.get("familyName").asText() + nameNode.get("givenName").asText();
			snsMap.put("name", uname);
			Iterator<JsonNode> iterEmails = rootNode.path("emails").elements();
			while (iterEmails.hasNext()) {
				JsonNode emailNode = iterEmails.next();
				String type = emailNode.get("type").asText();
				if (StringUtils.equals(type, "account")) {
					snsMap.put("email", emailNode.get("value").asText());
					break;
				}
			}
		}
		return snsMap;
	}
}
