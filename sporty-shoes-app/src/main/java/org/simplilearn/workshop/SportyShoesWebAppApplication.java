package org.simplilearn.workshop;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("org.simplilearn.workshop")
public class SportyShoesWebAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(SportyShoesWebAppApplication.class, args);
	}

}
