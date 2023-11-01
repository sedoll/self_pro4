package kr.ed.haebeop.config;

import kr.ed.haebeop.util.AdminInterceptor;
import kr.ed.haebeop.util.UserInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

// web.xml에 적용 했던 것들을 여기에 자바로 적용

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] {RootConfig.class, SecurityConfig.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] {ServletContext.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return new Filter[] {characterEncodingFilter};
    }
    
    @Bean // 회원 접근 권한
    public UserInterceptor userIntercepter() {
        return new UserInterceptor();
    }

    @Bean // 관리자 접근 권한
    public AdminInterceptor adminIntercepter() {
        return new AdminInterceptor();
    }
    
    // 접근 권한 위치 지정
    public void addInterceptors(InterceptorRegistry registry) {
        // 회원 접근 권한
        registry.addInterceptor(userIntercepter())
                .addPathPatterns("/boardPar/**").addPathPatterns("/boardTea/**")
                .addPathPatterns("/file/**").addPathPatterns("/infoAct/**")
                .addPathPatterns("/infoStu/**").addPathPatterns("/infoUni/**")
                .addPathPatterns("/grade/**").addPathPatterns("/cart/**").addPathPatterns("/payment/**");
        
        // 관리자 접근 권한
        registry.addInterceptor(adminIntercepter()).addPathPatterns("/admin/**");
    }
}
