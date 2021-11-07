import 'package:get/get.dart';

import '../work_model.dart';

class WorkProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Work.fromJson(map);
      if (map is List) return map.map((item) => Work.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Work?> getWork(int id) async {
    final response = await get('work/$id');
    return response.body;
  }

  Future<Response<Work>> postWork(Work work) async => await post('work', work);
  Future<Response> deleteWork(int id) async => await delete('work/$id');
}
