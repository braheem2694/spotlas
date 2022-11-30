import 'dart:async';

import 'package:get/get.dart';
import 'package:spotlas/app/main_screen/models/post_object.dart';

import '../../../main.dart';

class MainScreenController extends GetxController with StateMixin<dynamic> {
  RxBool loading = true.obs;
  RxDouble padding = 0.0.obs;
  RxList data = [].obs;
  RxList<bool> captionsMore = <bool>[].obs;
  RxList<bool> save = <bool>[].obs;
  RxList<bool> like = <bool>[].obs;
  RxList<bool> doubleClick = <bool>[].obs;
  RxInt duration = 600.obs;
  late Timer timer;


  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await api
        .getData("https://dev.api.spotlas.com/interview/feed?page=1")
        .then((value) {
      value
          .map((data) => Post.fromJson(data)).toList();
      captionsMore.value=List.generate(allPostsList.length, (index) => false);
      save.value=List.generate(allPostsList.length, (index) => false);
      like.value=List.generate(allPostsList.length, (index) => false);
      doubleClick.value=List.generate(allPostsList.length, (index) => false);
      loading.value=false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
