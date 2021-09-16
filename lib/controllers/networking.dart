import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future fetchData() async {
    var uri = Uri.parse(this.url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
