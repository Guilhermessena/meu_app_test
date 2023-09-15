import 'dart:convert';

import 'package:http/http.dart' as http;

class ViaCep {
  Future<Map<dynamic, dynamic>> retornaCep(String cep) async {
    var uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    var response = await http.get(uri);
    var responseDecoded = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(responseDecoded);
    return responseDecoded;
  }
}
