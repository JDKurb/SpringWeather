package com.simple.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TextController {

	@GetMapping("/")
	public String index() {
		return "The weather in Washington DC is currently: ";
	}

}