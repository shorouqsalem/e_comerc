import 'dart:io';

class HttpClientUtils {
  static Future<HttpClient> get _instance async =>
      _httpClient ??=  HttpClient();
  static HttpClient ? _httpClient;
  static HttpClientRequest ?_httpClientRequest;
  static HttpClientResponse? _httpClientResponse;

   static String url = "https://api.nationalize.io/?name=nathaniel";

  static Future<HttpClient> init() async {
    _httpClient = await _instance;
    return _httpClient!;
  }

  static Future<HttpClientResponse> login() async {
    _httpClient!.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    _httpClientRequest = await _httpClient!.getUrl(Uri.parse(url ));
    //_httpClientRequest.headers.set("device-Token", token);
    //_httpClientRequest.headers.set("content-type", "application/json");
   // _httpClientRequest!.add(utf8.encode(json.encode(body)));
    _httpClientResponse = await _httpClientRequest!.close();
    return _httpClientResponse!;
  }
}