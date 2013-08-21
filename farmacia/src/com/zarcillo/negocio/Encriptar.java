package com.zarcillo.negocio;

import java.security.MessageDigest;

/**
 *
 * @author saisa
 */
public class Encriptar {
 
    public static String encriptar(String ccadena) {
        String hash = "";
        try {
            //encriptar a sha-256        
            byte[] digest = null;
            byte[] buffer = ccadena.getBytes();
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.reset();
            messageDigest.update(buffer);
            digest = messageDigest.digest();

            for (byte aux : digest) {
                int b = aux & 0xff;
                if (Integer.toHexString(b).length() == 1) {
                    hash += "0";
                }
                hash += Integer.toHexString(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hash;
    }
    
}
