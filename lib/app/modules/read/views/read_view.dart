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
    final ReadController c = Get.put(ReadController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final maxScreenHeight = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    // if (Get.arguments == null) {
    //   Get.offAll(HomeView());
    //   return Scaffold();
    // }
    final Work work = Get.arguments;
    final horizontalPadding = 13;
    AppBar appBar = AppBar(
      // title: Text(work.title!),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      toolbarHeight: 62,
      actions: [
        IconButton(
          onPressed: () {
            c.textSize.value--;
          },
          icon: LineIcon.font(),
          iconSize: 16,
        ),
        IconButton(
          onPressed: () {
            c.textSize.value++;
          },
          icon: LineIcon.font(),
          iconSize: 24,
        ),
      ],
    );
    return Scaffold(
      // appBar: appBar,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.bottom,
          bottom: MediaQuery.of(context).padding.bottom,
          left: MediaQuery.of(context).padding.left + horizontalPadding,
          right: MediaQuery.of(context).padding.right + horizontalPadding,
        ),
        child: Column(
          children: [
            // Container(
            //   height: 1,
            //   color: kBorderColor,
            // ),
            Obx(() => Container(
                  height: maxScreenHeight,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: c.isLoading.isTrue
                      ? CircularProgressIndicator.adaptive()
                      : ListView(
                          padding: EdgeInsets.all(0),
                          children: [
                            // SizedBox(height: 12),
                            // Container(
                            //   alignment: Alignment.centerLeft,
                            //   child: IconButton(
                            //     onPressed: () {
                            //       Get.back();
                            //     },
                            //     icon: LineIcon.angleLeft(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .onBackground),
                            //     iconSize: 26,
                            //     padding: EdgeInsets.all(0),
                            //     splashRadius: 22,
                            //     constraints: BoxConstraints.tight(Size(32, 32)),
                            //   ),
                            // ),
                            SizedBox(height: 18),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    work.title ?? '',
                                    style: GoogleFonts.robotoSlab(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 25,
                                    ),
                                  ),
                                ]),
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
                            SizedBox(height: 25),
                            Text(
                              c.text.value,
                              style: GoogleFonts.robotoSlab(
                                fontSize: c.textSize.value.toDouble(),
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                )),
          ],
        ),
      ),
    );
  }
}
