package com.company;

import java.util.LinkedHashMap;
import java.util.Map;

public class Main {

    public static void main(String[] args) {
	// write your code here
        String[] strArr = string.split("");
        int count = 0;
        Map<String, Integer> map = new LinkedHashMap<>();
        for (int i = 0; i < strArr.length; i++) {
            if (map.containsKey(strArr[i])) {
                map.put(strArr[i], map.get(strArr[i])+1);
            } else {
                map.put(strArr[i], 1);
            }
        }
        for (Map.Entry<String, Integer> entry: map.entrySet()) {
            if (entry.getValue() > 1) {
                count++;
            }
        }
        String[] arr = new String[count];
        int i = 0;
        for (Map.Entry<String, Integer> entry: map.entrySet()) {
            if (entry.getValue() > 1) {
                arr[i] = entry.getKey();
                i++;
            }
        }
        return arr;

    }
}
