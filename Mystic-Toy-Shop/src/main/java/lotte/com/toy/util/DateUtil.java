package lotte.com.toy.util;

import java.sql.Timestamp;

public class DateUtil {

    public static String toYYYYMMDD(Timestamp date){
        String t = String.valueOf(date);
        t = t.substring(0,10);
        return t;
    }
}
