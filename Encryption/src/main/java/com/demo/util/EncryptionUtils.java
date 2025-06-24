package com.demo.util;
import java.lang.reflect.Field;
import java.security.GeneralSecurityException;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.demo.annotations.Decrypt;
import com.demo.annotations.Encrypt;

public class EncryptionUtils {

	// AES Algorithm and Transformation with padding
    private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES/ECB/PKCS5Padding"; 
    private static final String SECRET_KEY = "SRIYADAVSRIYADAV"; // 16-byte key for AES

    // Encrypts the input data using AES
    public static String encrypt(String data) throws GeneralSecurityException {
        SecretKeySpec key = new SecretKeySpec(SECRET_KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedBytes = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    // Decrypts the input encrypted data using AES
    public static String decrypt(String encryptedData) throws GeneralSecurityException {
        SecretKeySpec key = new SecretKeySpec(SECRET_KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decodedBytes = Base64.getDecoder().decode(encryptedData);
        byte[] decryptedBytes = cipher.doFinal(decodedBytes);
        return new String(decryptedBytes);
    }

    // Encrypts fields annotated with @Encrypt in the provided object
    public static <T> T processEncryption(T object) throws Exception {
        for (Field field : object.getClass().getDeclaredFields()) {
            if (field.isAnnotationPresent(Encrypt.class) && field.getType().equals(String.class)) {
                field.setAccessible(true);
                String value = (String) field.get(object);
                if (value != null) {
                    field.set(object, encrypt(value));
                }
            }
        }
        return object;
    }

    // Decrypts fields annotated with @Decrypt in the provided object
    public static <T> T processDecryption(T object) throws Exception {
        for (Field field : object.getClass().getDeclaredFields()) {
            if (field.isAnnotationPresent(Decrypt.class) && field.getType().equals(String.class)) {
                field.setAccessible(true);
                String value = (String) field.get(object);
                if (value != null) {
                    field.set(object, decrypt(value));
                }
            }
        }
        return object;
    }

    // Generates a random AES key (Optional, for dynamic key management)
    public static String generateRandomKey() throws GeneralSecurityException {
        KeyGenerator keyGen = KeyGenerator.getInstance(ALGORITHM);
        keyGen.init(128); // 128-bit key for AES
        SecretKey secretKey = keyGen.generateKey();
        return Base64.getEncoder().encodeToString(secretKey.getEncoded());
    }
}
