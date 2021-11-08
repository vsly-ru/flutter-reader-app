import 'dart:convert';
import 'dart:io';

import 'package:elisbetlee/app/modules/home/work_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ReadController extends GetxController {
  final isLoading = false.obs;
  String text = '';
  final textSize = 17.obs;

  final ScrollController scrolling = ScrollController();
  final RxDouble offset = RxDouble(0.0);

  bool done = false;

  Work work = Get.arguments;

  final RxList<String> lines = RxList.empty();

  @override
  void onReady() async {
    super.onReady();
    loadText();
    scrolling.addListener(() {
      print('${scrolling.offset} of ${scrolling.position.maxScrollExtent}');
      offset(scrolling.offset);
      if (!done &&
          scrolling.offset + 100 >= scrolling.position.maxScrollExtent &&
          scrolling.offset > 1000.0) {
        print('${work.title} прочитано');
        done = true;
        GetStorage().write(work.title ?? 'none', '1');
      }
    });
  }

  void loadText() async {
    isLoading(true);
    var client = http.Client();
    try {
      print('loading "https://elisbetlee.github.io/read/${work.file!}"');
      final http.Response response = await client
          .get(Uri.parse('https://elisbetlee.github.io/read/${work.file!}'));
      if (response.statusCode == 200) {
        text = utf8.decode(response.bodyBytes);
        lines(text.split('\n'));
      } else {
        lines.assignAll(['Не удалось загрузить ${work.file ?? 'текст'}']);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {}
}
