import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getHTTP(
    {required String url}) async {

  var response = await http.get(Uri.parse(url),);
  print("HEREEEEEE  get response ");
  print(response);

  return jsonDecode(response.body);
}
