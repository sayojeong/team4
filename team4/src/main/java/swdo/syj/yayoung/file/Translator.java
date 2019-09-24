package swdo.syj.yayoung.file;


import java.io.*;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
 
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
 
import org.json.simple.*;
import org.json.simple.parser.JSONParser;
 
 
public class Translator {
  private String apiClientId;
  private String apiSecret;
  private String text; // text to be translated
  private String sourceLang; // original language of text
  private String targetLang; // target language for translation
   
  public Translator(String apiClientId, String apiSecret){
    // provide the api key info for Naver Open API Translator here
    this.apiClientId = apiClientId;
    this.apiSecret = apiSecret;
  }
   
  public String translateText(String text, String sourceLang, String targetLang){
     
    
    String translatedText = null;
     
    try{
      String url = "https://openapi.naver.com/v1/language/translate";
       
      HttpClient client = HttpClientBuilder.create().build();
      HttpPost post = new HttpPost(url);
       
      // Set headers for API key authorization 
      post.addHeader("X-Naver-Client-Id", apiClientId);
      post.addHeader("X-Naver-Client-Secret",apiSecret);
       
      // Add parameters for POST
      List<NameValuePair> urlParams = new ArrayList<NameValuePair>();
      urlParams.add(new BasicNameValuePair("source", sourceLang));
      urlParams.add(new BasicNameValuePair("target", targetLang));
      urlParams.add(new BasicNameValuePair("text", text));
       
      // 한국어 일본어 중국어 깨짐 방지!
      post.setEntity(new UrlEncodedFormEntity(urlParams, "UTF-8"));
       
      // Response received after POST. The type of the output is JSON.
      HttpResponse response = client.execute(post);
 
      BufferedReader rd = new BufferedReader(
              new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
   
      StringBuffer result = new StringBuffer();
      String line = "";
      while ((line = rd.readLine()) != null) {
        result.append(line);
      }
 
 
      // Using json-simple to manipulate the JSON response
      String resultText = result.toString();
      Charset.forName("UTF-8").encode(resultText);
      JSONParser parser = new JSONParser();
      JSONObject obj = (JSONObject) parser.parse(resultText);
      JSONObject message = (JSONObject) obj.get("message");
       
      JSONObject res = (JSONObject) message.get("result");
 
      translatedText = (String) res.get("translatedText");
       
       
      
       
    }catch(Exception e){
      e.printStackTrace();
    }
   
    return translatedText;
     
  }
}


