import 'package:elisbetlee/app/modules/home/work_model.dart';
import 'package:elisbetlee/entrance_fader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_icons/line_icon.dart';

import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

const kBorderColor = Color(0x252C1811);

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final maxScreenHeight = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double headerHeight = 62;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('HomeView'),
      //   centerTitle: true,
      // ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            height: headerHeight + MediaQuery.of(context).padding.top,
            // color: Colors.deepPurple,
            padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: MediaQuery.of(context).padding.top + 13,
                bottom: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Елизавета Ликийская',
                  style: GoogleFonts.poiretOne(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(width: 8),
                // Text(
                //   'Писательница',
                //   style: GoogleFonts.poiretOne(
                //     fontSize: 16,
                //     fontWeight: FontWeight.w300,
                //     color: Theme.of(context).colorScheme.onSurface,
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 1,
              color: kBorderColor,
            ),
          ),
          // SizedBox(height: 16),
          Container(
            height: maxScreenHeight - headerHeight - 1,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            // color: Colors.deepPurple,
            child: Obx(() => ListView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: c.isLoading.isTrue
                      ? [CircularProgressIndicator.adaptive()]
                      : c.list.isEmpty
                          ? [
                              TextButton(
                                  onPressed: c.loadList,
                                  child: Text('Обновить'))
                            ]
                          : items(context, c.list),
                )),
          )
        ],
      ),
    );
  }
}

// -------------------------------------

List<Widget> items(BuildContext context, RxList<Work> list) {
  List<Widget> re = [];
  for (var i = 0; i < list.length; i++) {
    final Work item = list[i];
    final String title = item.title ?? '';
    final finished = GetStorage().read<String>(title) == '1';
    re.add(EntranceFader(
      // delay: Duration(milliseconds: i > 3 ? 4 * 222 : i * 222),
      // duration: Duration(milliseconds: 555),
      child: Container(
        // color: Colors.deepPurple,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.robotoSlab(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w200,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 7),
            Row(
              children: [
                LineIcon.book(
                    color: Theme.of(context).colorScheme.onSurface, size: 16),
                SizedBox(width: 2),
                Text(
                  (item.category != null ? item.category! + ', ' : '') +
                      (item.genre ?? ''),
                  style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(width: 13),
                LineIcon.calendarAlt(
                    color: Theme.of(context).colorScheme.onSurface, size: 16),
                SizedBox(width: 2),
                Text(
                  item.date ?? '',
                  style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              item.desctiption ?? '',
              style: GoogleFonts.roboto(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed('/read', arguments: item);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                    child: Text(
                      'Читать',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    ),
                  ),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(88, 34)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.onPrimary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                ),
                SizedBox(width: 7),
                Text(
                  finished
                      ? 'Прочитано'
                      : item.time != null && item.time!.isNotEmpty
                          ? '~' + item.time!
                          : '',
                  style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(height: 25),
            if (i < list.length - 1)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 0.7,
                  color: kBorderColor,
                ),
              )
          ],
        ),
      ),
    ));
  }
  return re;
}
