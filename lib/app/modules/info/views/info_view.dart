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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () => Get.back(),
        ),
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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching info'));
          } else if (snapshot.data == null) {
            return const Center(child: Text('No data found'));
          } else {
            final List<InfoRes> info = snapshot.data as List<InfoRes>;
            return Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: 500,
                height: 500,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://coinoneglobal.in/crm/UploadFiles/Template/${info[0].imgUrl}',
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text('Item: ${info[0].name.toString()}'),
                        subtitle: Text(
                          'Id: ${info[0].id.toString()}',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Image Path: ${info[0].imgUrlPath.toString()}',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
