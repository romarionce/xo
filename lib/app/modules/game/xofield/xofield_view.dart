import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo/app/modules/game/xofield/xofield_controller.dart';

const controllerTag = 'ctrlTagXO_';

class XOFieldView extends GetView<XOFieldController> {
  final int num;
  final XOState type;
  final Function onMoveEnd;
  const XOFieldView(this.num, this.type, this.onMoveEnd, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(XOFieldController(num: num), tag: "$controllerTag$num");
    return GestureDetector(
      onTap: () {
        if (controller.item == XOState.e) {
          controller.changeItem(type);
          onMoveEnd();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Obx(() => Text(
                controller.item.str,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}
