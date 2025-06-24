package com.demo.util;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
		private static Pattern letter = Pattern.compile("[a-zA-z]");
		//private static Pattern digit = Pattern.compile("[0-9]");
		
		public static boolean isEmptyOrNull(final String val) {
			return ((val == null) || "".equals(val.trim())
					|| AppConstants.NULL_VAR.equals(val) || AppConstants.NULL_VAR
						.equalsIgnoreCase(val));
		}
	public static boolean validatePasswordWithStrongNess(final String password) {
			
			int n = password.length(); 
			final Matcher hasLetter = letter.matcher(password);
			boolean status=false;
	        boolean hasLower = false, hasUpper = false, specialChar = false,hasDigit =false; 
	        Set<Character> set = new HashSet<>(
	        	    Arrays.asList('!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '+')
	        	);
	        for (char i : password.toCharArray()) 
	        { 
	            if (Character.isLowerCase(i)) 
	                hasLower = true; 
	            if (Character.isUpperCase(i)) 
	                hasUpper = true; 
	            if (Character.isDigit(i)) 
	                hasDigit = true; 
	            if (set.contains(i)) 
	                specialChar = true; 
	        } 
			
	        if (hasLetter.find() && hasDigit && hasLower && hasUpper && specialChar && (n >= 8)) {
	        	status =true;			
	        }		

			return status;
		}

		public static String maskAccountNumber(String accountNumber) {
			if (accountNumber == null || accountNumber.length() < 4) {
				return accountNumber; // or throw an exception if this case is invalid
			}
			String lastFourDigits = accountNumber.substring(accountNumber.length() - 4);
			return "xxx-xxx-xxx-" + lastFourDigits;
		}
		 public static String cleanPath(String path) {
		        if (path == null) {
		            return null;
		        }

		        String normalizedPath = path.replace("\\", "/"); // Convert Windows backslashes to forward slashes
		        String[] parts = normalizedPath.split("/");

		        // Use a StringBuilder to build the cleaned path
		        StringBuilder cleanedPath = new StringBuilder();

		        for (String part : parts) {
		            if (part.equals("..")) {
		                // Remove the previous part if ".." is encountered
		                int lastSlash = cleanedPath.lastIndexOf("/");
		                if (lastSlash > 0) {
		                    cleanedPath.delete(lastSlash, cleanedPath.length());
		                }
		            } else if (!part.equals(".") && !part.isEmpty()) {
		                // Append non-empty parts and skip "." which represents the current directory
		                cleanedPath.append("/").append(part);
		            }
		        }

		        // Handle the case where the path starts with a "/"
		        if (normalizedPath.startsWith("/")) {
		            return "/" + cleanedPath.toString();
		        } else {
		            return cleanedPath.toString();
		        }
		    }

		    public static void main(String[] args) {
		        String unsafePath = "../uploads/../config/./settings.xml";
		        String cleanPath = cleanPath(unsafePath);

		        System.out.println("Original Path: " + unsafePath);
		        System.out.println("Cleaned Path: " + cleanPath);
		    }
}
