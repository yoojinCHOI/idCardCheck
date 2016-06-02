package com.mycard.action;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


public class bringMap {

	public static Map<String, Object> getParameter(
			Map<String, String[]> paramMap) {
		ArrayList<String> keyList = getKeyList(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < keyList.size(); i++) {

			String key = keyList.get(i);
			String value = (String) paramMap.get(keyList.get(i))[0].trim();

			

			if (value != null && !value.equals("") && !value.equals("null")) {
				if (isNumber(value)) {
				//	try {
				//		map.put(key, (Integer) Integer.parseInt(value));
				//	} catch (Exception e) {
						map.put(key, value);
				//	}
				} else {
					map.put(key, value);
				}
			} else if (value.equals("null")) {
				map.put(key, null);
			}
		}
		return map;
	}

	public static ArrayList<String> getKeyList(Map<String, String[]> paramMap) {
		
		Set<String> keySet = paramMap.keySet();
		Iterator<String> it = keySet.iterator();

		ArrayList<String> keyList = new ArrayList<String>();

		while (it.hasNext()) {
			String key = it.next();
			keyList.add(key);
			
		}

		

		return keyList;
	}

	public static boolean isNumber(String str) {
		boolean check = true;
		for (int i = 0; i < str.length(); i++) {
			if (i == 0) {
				Character cr = new Character(str.charAt(i));
				String vstr = cr.toString();
				if (vstr.equals("0")) {
					check = false;
					break;
				}
			} else {
				if (!Character.isDigit(str.charAt(i))) {
					check = false;
					break;
				}// end if
			}
		} // end for
		return check;
	} // isNumber

}
