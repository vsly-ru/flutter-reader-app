import 'package:elisbetlee/app/modules/home/views/home_view.dart';
import 'package:elisbetlee/app/modules/home/work_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/read_controller.dart';

class ReadView extends GetView<ReadController> {
  @override
  Widget build(BuildContext context) {
    if (Get.arguments == null) {
      // Get.offAll(HomeView());
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            children: [
              Text('Не выбрано произведение.'),
              TextButton(
                  onPressed: () {
                    Get.off(HomeView());
                  },
                  child: Text('Вернуться'))
            ],
          ),
        ),
      );
    }
    final ReadController c = Get.put(ReadController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final maxScreenHeight = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final Work work = Get.arguments;
    final horizontalPadding = 13;
    return Scaffold(
      // appBar: AppBar(
      //   title: Obx(() => Text(
      //       '${c.offset.toStringAsFixed(1)} of ${c.scrolling.position.maxScrollExtent.toInt()}')),
      // ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.bottom,
          bottom: MediaQuery.of(context).padding.bottom,
          left: MediaQuery.of(context).padding.left + horizontalPadding,
          right: MediaQuery.of(context).padding.right + horizontalPadding,
        ),
        child: Obx(() => Container(
              height: maxScreenHeight,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: c.isLoading.isTrue
                  ? CircularProgressIndicator.adaptive()
                  : ListView(
                      controller: c.scrolling,
                      padding: EdgeInsets.all(0),
                      children: content(context, work, c)),
            )),
      ),
    );
  }
}

List<Widget> content(BuildContext context, Work work, ReadController c) {
  if (c.lines.isEmpty) return [];
  if (c.lines.length < 2) return [Text(c.lines[0])];
  List<Widget> re = [
    SizedBox(height: 18),
    Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: LineIcon.angleLeft(
            color: Theme.of(context).colorScheme.onBackground),
        iconSize: 26,
        padding: EdgeInsets.all(0),
        splashRadius: 22,
        constraints: BoxConstraints.tight(Size(32, 32)),
      ),
    ),
    SizedBox(height: 15),
    Row(mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            work.title ?? '',
            style: GoogleFonts.robotoSlab(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
          ),
        ]),
    SizedBox(height: 22),
    // Row(
    //   children: [
    //     IconButton(
    //       onPressed: () {
    //         c.textSize.value--;
    //       },
    //       icon: LineIcon.minus(
    //           color: Theme.of(context)
    //               .colorScheme
    //               .primary),
    //       iconSize: 18,
    //       padding: EdgeInsets.all(4),
    //       splashRadius: 25,
    //     ),
    //     Text(
    //       'Размер шрифта',
    //       style: GoogleFonts.roboto(
    //         color:
    //             Theme.of(context).colorScheme.onSurface,
    //         fontWeight: FontWeight.w300,
    //         fontSize: 18,
    //       ),
    //     ),
    //     IconButton(
    //       onPressed: () {
    //         c.textSize.value++;
    //       },
    //       icon: LineIcon.plus(
    //           color: Theme.of(context)
    //               .colorScheme
    //               .primary),
    //       iconSize: 18,
    //       padding: EdgeInsets.all(4),
    //       splashRadius: 25,
    //     ),
    //   ],
    // ),
  ];
  for (var i = 0; i < c.lines.length; i++) {
    String s = c.lines[i];
    s = s.trimLeft();
    // List<TextSpan> spans = [TextSpan(text: s)];
    RichText container = RichText(
        text: TextSpan(
      text: s,
      // children: spans,
      style: GoogleFonts.robotoSlab(
        fontSize: c.textSize.value.toDouble(),
        fontWeight: FontWeight.w300,
        color: Theme.of(context).colorScheme.onBackground,
      ),
    ));
    if (work.title == 'Берегись дерева гинкго' && s == '*') {
      re.add(Container(
        // width: 24,
        height: 32,
        padding: EdgeInsets.all(3),
        // color: Colors.deepPurple,
        // alignment: Alignment.centerLeft,
        child: Opacity(
            opacity: 0.5, child: Image.asset('assets/images/ginkgo.png')),
      ));
    } else {
      re.add(container);
    }
    re.add(SizedBox(height: 18));
  }
  re.add(SizedBox(height: 25)); // bottom spacing
  re.add(Container(
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: LineIcon.home(color: Theme.of(context).colorScheme.onBackground),
      iconSize: 26,
      padding: EdgeInsets.all(0),
      splashRadius: 22,
      constraints: BoxConstraints.tight(Size(32, 32)),
    ),
  ));
  re.add(SizedBox(height: 33)); // bottom spacing
  return re;
}
