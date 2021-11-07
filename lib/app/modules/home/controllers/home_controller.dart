import 'package:elisbetlee/app/modules/home/work_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  final RxList<Work> list = RxList.empty();

  @override
  void onInit() {
    super.onInit();
  }

  void loadList() {
    list.assignAll([Work.test()]);
  }

  @override
  void onReady() {
    super.onReady();
    loadList();
  }

  @override
  void onClose() {}
}
