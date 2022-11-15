package com.practice.helper;

import java.text.DecimalFormat;

public class Helper {

    public static String get10Characters(String desc) {
        String[] strs = desc.split(" ");
        if (strs.length > 12) {
            String res = "";
            for (int i = 0; i <= 12; i++) {
                res = res + strs[i]+" ";
            }
            return (res + "....");

        } else {

            return (desc + "....");
        }
    }
    public static String getNumberinFormat(int d) {
 
        DecimalFormat df=new DecimalFormat("#,###");
 
        
        String formattedNumberWithComma = df.format(d);
        return formattedNumberWithComma;
    }
}
