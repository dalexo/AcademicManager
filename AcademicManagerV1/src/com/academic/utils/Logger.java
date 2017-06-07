package com.academic.utils;

public class Logger {
	public static void logDebug(String message) {
		System.out.println(message);
	}

	public static void logException(Exception exception) {
		exception.printStackTrace();
	}
}
