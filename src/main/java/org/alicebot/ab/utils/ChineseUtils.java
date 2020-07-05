package org.alicebot.ab.utils;

import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.seg.common.Term;

import java.util.List;

public class ChineseUtils {

    public static String splitChinese(String request){
        request=request.trim();
        request = request.replace("。",".");
        request = request.replace("？","?");
        request = request.replace("！","!");
        if(!isChinese(request)){
            System.err.println("not chinese");
            return request;
        }
        List<Term> segment = HanLP.segment(request);
        StringBuffer sb=new StringBuffer();
        for (int i = 0; i < segment.size(); i++) {
            Term term =  segment.get(i);
            String word = term.word;
            if(word.trim().length()>0){

                sb.append(word).append(" ");
            }
        }
        System.err.println(sb.toString()+">>");
        return sb.toString();
    }
    // 根据Unicode编码完美的判断中文汉字和符号
    private static boolean isChinese(char c) {
        Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
        if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS || ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
                || ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A || ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B
                || ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION || ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS
                || ub == Character.UnicodeBlock.GENERAL_PUNCTUATION) {
            return true;
        }
        return false;
    }

    // 完整的判断中文汉字和符号
    public static boolean isChinese(String strName) {
        char[] ch = strName.toCharArray();
        for (int i = 0; i < ch.length; i++) {
            char c = ch[i];
            if (isChinese(c)) {
                return true;
            }
        }
        return false;
    }
}
