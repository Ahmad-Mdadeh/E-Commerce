import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatelessWidget {
  final RxList<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ].obs;
  final RxInt currentSelected = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sizeList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        itemBuilder: (context, index) => Obx(() {
          return GestureDetector(
            onTap: () {
              currentSelected.value = index;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 9.0,
              ),
              child: TextUtils(
                text: sizeList[index],
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
              decoration: BoxDecoration(
                color: currentSelected.value == index
                    ? Get.isDarkMode
                        ? pinkClr.withOpacity(0.4)
                        : mainColor.withOpacity(0.4)
                    : Get.isDarkMode ? Colors.white : Colors.white30,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 2.0,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
