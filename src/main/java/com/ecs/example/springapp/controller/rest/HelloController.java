package com.ecs.example.springapp.controller.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Created by arang on 6/01/2018.
 */
@RestController
public class HelloController
{

    private Logger logger = LoggerFactory.getLogger(getClass());
    @RequestMapping("/greeting")
    public Message greeting()
    {
        logger.info("request greeting..");
        return new Message() {
            @Override
            public long  getId() {
                return new Date().getTime();
            }

            @Override
            public String getData() {
                return "Hello World";
            }
        };
    }
}
