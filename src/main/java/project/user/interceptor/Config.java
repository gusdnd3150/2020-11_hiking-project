package project.user.interceptor;//package project.user.interceptor;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
//import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
//
//@EnableRedisHttpSession 
//public class Config {
//        @Bean
//        public LettuceConnectionFactory connectionFactory() {
//                LettuceConnectionFactory connectionFactory = new LettuceConnectionFactory();
//        		connectionFactory.setHostName("localhost");
//        		connectionFactory.setPort(6379);
//        		return connectionFactory;
//        }
//}