package com.websprint.backend.Config;

import java.io.IOException;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

// NEW FILE. Lets a request for "/login" quietly serve static/login.html,
// without redirecting (the URL bar keeps showing "/login", not
// "/login.html") and without needing a Java controller method per page.
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/")
                .resourceChain(true)
                .addResolver(new PathResourceResolver() {
                    @Override
                    protected Resource getResource(String resourcePath, Resource location) throws IOException {
                        // Step 1: try the exact path first — this is what
                        // keeps /css/base.css, /js/script.js, /Images/*.jpg
                        // working normally, completely unaffected.
                        Resource requested = location.createRelative(resourcePath);
                        if (requested.exists() && requested.isReadable()) {
                            return requested;
                        }

                        // Step 2: exact path not found (e.g. someone
                        // requested "/login" with no extension) — try
                        // appending ".html" and see if THAT file exists.
                        if (!resourcePath.contains(".")) {
                            Resource htmlVersion = location.createRelative(resourcePath + ".html");
                            if (htmlVersion.exists() && htmlVersion.isReadable()) {
                                return htmlVersion;
                            }
                        }

                        // Step 3: genuinely doesn't exist — let Spring
                        // return its normal 404.
                        return null;
                    }
                });
    }
}