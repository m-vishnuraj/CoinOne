import 'package:coin_one/app/data/models/info_res.dart';
import 'package:coin_one/app/modules/widgets/card_widget.dart';
import 'package:coin_one/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(InfoController(), permanent: true);
    final arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        title: const Text(
          'Info',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getInfo(arg),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CardWidget(
                      Name: 'Name',
                      Img:
                          'https://coinoneglobal.in/crm/UploadFiles/Template/coinone.png',
                    ),
                  )),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching info'));
          } else if (snapshot.data == null) {
            return const Center(child: Text('No data found'));
          } else {
            final List<InfoRes> info = snapshot.data as List<InfoRes>;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Center(
                    child: Image.network(
                      'https://coinoneglobal.in/crm/UploadFiles/Template/${info[0].imgUrl}',
                      width: 500,
                      height: 500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Id: ${info[0].id}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    kWidth,
                    Text(
                      'Name : ${info[0].name}',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'imgUrlPath : ${info[0].imgUrlPath}',
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
