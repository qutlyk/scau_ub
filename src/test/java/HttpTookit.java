import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.httpclient.util.URIUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONException;
import org.json.JSONObject;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
* HTTP工具箱
*
* @author leizhimin 2009-6-19 16:36:18
* @author dlf 2014 12 20 00:19
 */
public final class HttpTookit {
        private static Log log = LogFactory.getLog(HttpTookit.class);

        /**
         * 执行一个HTTP GET请求，返回请求响应的HTML
         *
         * @param url                 请求的URL地址
         * @param queryString 请求的查询参数,可以为null
         * @param charset         字符集
         * @param pretty            是否美化
         * @return 返回请求响应的HTML
         */
        public static String doGet(String url, String queryString, String charset, boolean pretty) {
                StringBuffer response = new StringBuffer();
                HttpClient client = new HttpClient();
                HttpMethod method = new GetMethod(url);
                try {
                        if (queryString!=null)
                                //对get请求参数做了http请求默认编码，好像没有任何问题，汉字编码后，就成为%式样的字符串
                                method.setQueryString(URIUtil.encodeQuery(queryString));
                        client.executeMethod(method);
                        if (method.getStatusCode() == HttpStatus.SC_OK) {
                                BufferedReader reader = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream(), charset));
                                String line;
                                while ((line = reader.readLine()) != null) {
                                        if (pretty)
                                                response.append(line).append(System.getProperty("line.separator"));
                                        else
                                                response.append(line);
                                }
                                reader.close();
                        }
                } catch (URIException e) {
                        log.error("执行HTTP Get请求时，编码查询字符串“" + queryString + "”发生异常！", e);
                } catch (IOException e) {
                        log.error("执行HTTP Get请求" + url + "时，发生异常！", e);
                } finally {
                        method.releaseConnection();
                }
                return response.toString();
        }

        /**
         * 执行一个HTTP POST请求，返回请求响应的HTML
         *
         * @param url         请求的URL地址
         * @param params    请求的查询参数,可以为null
         * @param charset 字符集
         * @param pretty    是否美化
         * @return 返回请求响应的HTML
         */
        public static String doPost(String url, Map<String, String> params, String charset, boolean pretty) {
                StringBuffer response = new StringBuffer();
                HttpClient client = new HttpClient();
                HttpMethod method = new PostMethod(url);
                //设置Http Post数据
                if (params != null) {
                        HttpMethodParams p = new HttpMethodParams();
                        for (Map.Entry<String, String> entry : params.entrySet()) {
                                p.setParameter(entry.getKey(), entry.getValue());
                        }
                        method.setParams(p);
                }
                try {
                        client.executeMethod(method);
                        if (method.getStatusCode() == HttpStatus.SC_OK) {
                                BufferedReader reader = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream(), charset));
                                String line;
                                while ((line = reader.readLine()) != null) {
                                        if (pretty)
                                                response.append(line).append(System.getProperty("line.separator"));
                                        else
                                                response.append(line);
                                }
                                reader.close();
                        }
                } catch (IOException e) {
                        log.error("执行HTTP Post请求" + url + "时，发生异常！", e);
                } finally {
                        method.releaseConnection();
                }
                return response.toString();
        }
        
        /***
         * 将json转换为map
         * @param jsonString
         * @return
         * @throws JSONException
         */
        public static Map<String, String> toMap(String jsonString) throws JSONException  {
System.out.println(jsonString);
            JSONObject jsonObject = new JSONObject(jsonString);
            
            Map<String, String> result = new HashMap<String, String>();
            Iterator<?> iterator = jsonObject.keys();
            String key = null;
            String value = null;
            
            while (iterator.hasNext()) {

                key = (String) iterator.next();
                if(!key.equals("images")) {
                    value = jsonObject.getString(key);
                    result.put(key, value);
                }

            }
            System.out.println(result);
            return result;

        }
        public static void main(String[] args) {
            String isbn="9787115290366";
            String uri="https://api.douban.com/v2/book/isbn/:"+isbn;
            parse(uri);
        }

        public static void parse(String uri)  {
                String y = doGet(uri, null, "UTF-8", true);
            //    System.out.println(y);
                y=y.replace("\"", "'");  //将得到的json数据中的双引号改为单引号
                
                y=y.replaceAll("\\\\","/");   //以下步骤将\改为/(url有用)
                y=y.replaceAll("//","/");

            //    System.out.println(y);
                Map<String, String> map=null;
                try {
                    map = toMap(y);
                } catch (JSONException e) {
                    // TODO Auto-generated catch block
                    System.out.println("解析错误");
                    e.printStackTrace();
                }
                
                iteator(map);
                print(map);       
        }

        /***
         * 打印书的所有信息
         * @param map
         */
        public static void  iteator(Map<String, String> map){
             Iterator<?> iter = map.entrySet().iterator();
             String key,value;
             while(iter.hasNext()) {
                 Map.Entry entry = (Map.Entry)iter.next();

                 key = (String)entry.getKey();
                 value = (String)entry.getValue();
                 System.out.println(key+"   "+value);
             }
        }
        
        
        /***
         * 打印书的关键信息
         * @param map
         */
        public static  void print(Map<String, String> map){
            System.out.println("*********");
            System.out.println("书名  "+map.get("title"));
            String author=map.get("author").toString();
            author=author.replace("[", "");
            author=author.replace("]", "");
            author=author.replace("\"", "");
            System.out.println("作者  "+author);
            System.out.println("原价格  "+map.get("price"));
            System.out.println("出版社  "+map.get("publisher"));
            System.out.println("出版日期  "+map.get("pubdate"));
            System.out.println("isbn  "+map.get("isbn10"));
            Map<String, String> map2=null;
            try {
                map2=toMap(map.get("images").toString().replace("\"", "'"));
            } catch (JSONException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            System.out.println("small images "+map2.get("small"));
            System.out.println("medium images "+map2.get("medium"));
            System.out.println("small large "+map2.get("large"));
            
        }
}