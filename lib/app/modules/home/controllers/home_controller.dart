import 'package:elisbetlee/app/modules/home/providers/work_provider.dart';
import 'package:elisbetlee/app/modules/home/work_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  final RxList<Work> list = RxList.empty();

  @override
  void onInit() {
    super.onInit();
  }

  void loadList() async {
    isLoading(true);
    try {
      List<dynamic>? results = await WorkProvider().getWorks();
      if (results != null) {
        print(results);
        List<Work> converted = [];
        for (var i = 0; i < results.length; i++) {
          converted.add(Work.fromJson(results[i]));
        }
        list.assignAll(converted);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadList();
  }

  @override
  void onClose() {}
}
