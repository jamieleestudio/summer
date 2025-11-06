package com.summer.utils;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HttpUtils {

    public static void main(String[] args) {
        try {
//			System.out.println(httpGet("http://httpbin.org/get"));
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("ha", 1);
            map.put("name", "你好");
            map.put("password", "123455");
            System.out.println(httpPost("http://httpbin.org/post",map));
//			System.out.println(httpPost("http://172.28.1.97:443/news/realEstateNews/test",map));
			/*for(int i=0;i<100;i++){
				System.out.println(httpGet("http://zs.xiguaji.com/Register/GetValidateCode"));
				System.err.println(i);
			}*/
//			System.out.println(httpPost("http://httpbin.org/post"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String httpPost(String url,Map<String,Object> map) throws IOException{

        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        String result;
        CloseableHttpResponse response = null;
        try {

            if(null != map){
                List<NameValuePair> naps = new ArrayList<>();
                for (Map.Entry<String,Object> entry : map.entrySet()) {
                    naps.add(new BasicNameValuePair(entry.getKey(), entry.getValue().toString()));
                }
                httpPost.setEntity(new UrlEncodedFormEntity(naps, Consts.UTF_8));
            }
            response= httpclient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity);
            EntityUtils.consume(entity);
        } finally {
            closeHttpClient(response, httpclient);
        }
        return result;
    }

    public static String httpGet(String url) throws IOException {

        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpget = new HttpGet(url);
        CloseableHttpResponse response = httpclient.execute(httpget);
        HttpEntity httpEntity = response.getEntity();
        String result = EntityUtils.toString(httpEntity, Consts.UTF_8);
        try {
            EntityUtils.consume(httpEntity);
        } finally {
            closeHttpClient(response, httpclient);
        }
        return result;
    }

    private static void closeHttpClient(CloseableHttpResponse response,CloseableHttpClient httpclient){

        try {
            if(null != response){
                response.close();
            }
            if(null != httpclient){
                httpclient.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
