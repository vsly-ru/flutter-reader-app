import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../work_model.dart';

class WorkProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Work.fromJson(map);
    //   if (map is List) return map.map((item) => Work.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<dynamic>?> getWorks() async {
    var client = http.Client();
    final http.Response response = await client
        .get(Uri.parse('https://elisbetlee.github.io/content.json'));
    // final response =
    //     await httpClient.get('https://elisbetlee.github.io/content.json');
    print('~response:');
    // print(response);
    if (response.bodyBytes.isNotEmpty) {
      print('~parsing response..');
      List<dynamic> maps = jsonDecode(utf8.decode(response.bodyBytes));
      return maps;
    }
    print('~returning null');
    return null;
  }
}
