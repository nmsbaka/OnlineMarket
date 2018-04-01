package onlinemarket.util;

public class Help {

    public static boolean isInteger(String s) {
        if(s.isEmpty()) return false;
        s = s.trim();
        for(int i = 0; i < s.length(); i++) {
            if(i == 0 && s.charAt(i) == '-') {
                if(s.length() == 1) return false;
                else continue;
            }
            if(Character.digit(s.charAt(i),10) < 0) return false;
        }
        return true;
    }

}
