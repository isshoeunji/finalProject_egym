package kosta.mvc.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import kosta.mvc.service.MemberService;

@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class MultiHttpSecurityConfig {

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) {
	}
	
	@Autowired
    private MemberService memberService;
	
	
	public class AuthenticationFilterAnotherParam extends UsernamePasswordAuthenticationFilter {
		
		@Override
		public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
				throws AuthenticationException {
			String prevSessionId = request.getParameter("prevSessionId");
			HttpSession session = request.getSession();
			session.setAttribute("prevSessionId", prevSessionId);
			return super.attemptAuthentication(request, response);
		}
		
	    @Override

	    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
	                Authentication authResult) throws IOException, ServletException {
	            setAuthenticationSuccessHandler(new SimpleUrlAuthenticationSuccessHandler("/shop/main"));
	            super.successfulAuthentication(request, response, chain, authResult);
	      }

       @Override
       protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
               AuthenticationException failed) throws IOException, ServletException {
           setAuthenticationFailureHandler(new SimpleUrlAuthenticationFailureHandler("/shop/login"));
           super.unsuccessfulAuthentication(request, response, failed);

       }   
	}
	
	public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
	
	@Order(1)
	@Configuration
	public class ShopSecurityConfig extends WebSecurityConfigurerAdapter {
		
		@Bean
		@Override
		public AuthenticationManager authenticationManagerBean() throws Exception {
			return super.authenticationManagerBean();
		}



		@Bean
		public AuthenticationFilterAnotherParam authenticationFilterAnotherParam() throws Exception {
	       AuthenticationFilterAnotherParam authenticationFilterAnotherParam = new AuthenticationFilterAnotherParam();
	       authenticationFilterAnotherParam.setAuthenticationManager(this.authenticationManagerBean());
	       authenticationFilterAnotherParam.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/shop/loginProcess","POST"));
	       return authenticationFilterAnotherParam;
		}
		
		
		public ShopSecurityConfig() {
		}
		
		@Override
		public void configure(WebSecurity web) throws Exception  {
	        // static 디렉터리의 하위 파일 목록은 인증 무시 ( = 항상통과 )
	        web.ignoring().antMatchers("/assets/**", "/css/**", "/js/**", "/img/**", "/lib/**");
	    }
		
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http
	        .antMatcher("/shop/**")  //반드시 antMatcher

	        .authorizeRequests()
	        .antMatchers("/shop/admin/**").hasRole("ADMIN")
	        .antMatchers("/shop/user/**").hasRole("MEMBER")
	            .and() // 로그인 설정
	                .formLogin()
	                //.loginPage("/login")
	                .loginPage("/shop/login")
	                .loginProcessingUrl("/shop/loginProcess")
	                .defaultSuccessUrl("/shop/main")
	                .permitAll()
	                
	            .and() // 로그아웃 설정
	                .logout()
	                .logoutRequestMatcher(new AntPathRequestMatcher("/shop/logout"))
	                .logoutSuccessUrl("/shop")
	                .invalidateHttpSession(true)
	            .and()
	                // 403 예외처리 핸들링
	                .exceptionHandling().accessDeniedPage("/shop")
	            .and()
	                .csrf().disable();
	         http.addFilterBefore(authenticationFilterAnotherParam(),UsernamePasswordAuthenticationFilter.class); 
	    }

	    @Override
	    public void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
	    }
	}

	
	//@Order(2)
	@Configuration
	public class SecurityConfig extends WebSecurityConfigurerAdapter {
		
		public SecurityConfig() {
			System.out.println("SecurityConfig..................");
		}
		
	    @Override
	    public void configure(WebSecurity web) throws Exception
	    {
	        // static 디렉터리의 하위 파일 목록은 인증 무시 ( = 항상통과 )
	        web.ignoring().antMatchers("/assets/**", "/css/**", "/js/**", "/img/**", "/lib/**");
	    }

	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	    	//http.requestMatchers()
	    	http.authorizeRequests()
	                // 페이지 권한 설정
	                .antMatchers("/admin/**").hasRole("ADMIN")
	                .antMatchers("/user/**").hasRole("MEMBER")
	                //.antMatchers("/shop/**").hasRole("MEMBER")
	                //.antMatchers("/**").anonymous()
	            .and() // 로그인 설정
	                .formLogin()
	                .loginPage("/login")
	                .defaultSuccessUrl("/login/main")
	                .authenticationDetailsSource(null)
	                .permitAll()
	                
	            .and() // 로그아웃 설정
	                .logout()
	                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	                .logoutSuccessUrl("/main")
	                .invalidateHttpSession(true)
	            .and()
	                // 403 예외처리 핸들링
	                .exceptionHandling().accessDeniedPage("/user/denied")
	            .and()
	                .csrf().disable(); 
	    	http.sessionManagement()
            .maximumSessions(1)
            .maxSessionsPreventsLogin(false)
            .expiredUrl("/duplicated-login")
            .sessionRegistry(sessionRegistry());


	    }

	 // logout 후 login할 때 정상동작을 위함
	    @Bean
	    public SessionRegistry sessionRegistry() {
	        return new SessionRegistryImpl();
	    }



	    @Override
	    public void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
	    }
	}
	
}
