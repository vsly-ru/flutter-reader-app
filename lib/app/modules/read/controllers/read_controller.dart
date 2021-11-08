import 'dart:convert';
import 'dart:io';

import 'package:elisbetlee/app/modules/home/work_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReadController extends GetxController {
  //TODO: Implement ReadController

  final isLoading = false.obs;
  final text = ''.obs;
  final textSize = 18.obs;

  @override
  void onReady() async {
    super.onReady();
    loadText();
  }

  void loadText() async {
    isLoading(true);
    final Work work = Get.arguments;
    var client = http.Client();
    try {
      print('loading "https://elisbetlee.github.io/read/${work.file!}"');
      final http.Response response = await client
          .get(Uri.parse('https://elisbetlee.github.io/read/${work.file!}'));
      if (response.statusCode == 200) {
        text(utf8.decode(response.bodyBytes));
      } else {
        text('Не удалось загрузить ${work.file ?? 'текст'}');
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {}
}
