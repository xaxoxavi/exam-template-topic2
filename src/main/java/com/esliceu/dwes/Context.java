package com.esliceu.dwes;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Context {

    private static ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

    public static ClassPathXmlApplicationContext getContext() {
        return context;


    }
}
