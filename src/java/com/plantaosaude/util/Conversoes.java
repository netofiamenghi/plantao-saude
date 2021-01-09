package com.plantaosaude.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Conversoes {

    public static Date converterStringDate(String data) throws Exception {

        if (data != null || !data.equals("")) {
            SimpleDateFormat fmt = new SimpleDateFormat("HH:mm:ss");
            Date novaData = fmt.parse(data);
            return novaData;
        } else {
            return null;
        }
    }
    
    
    
}
