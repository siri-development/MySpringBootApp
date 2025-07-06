package com.demo; 

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.demo"})
public class EncryptionApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(EncryptionApplication.class, args);
		System.out.println("==============Build Success of Encryption Project==============");
	}
	@Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	        return builder.sources(EncryptionApplication.class);
	    }
}
