import 'package:get/get.dart';
import 'package:xo/app/modules/game/xofield/xofield_controller.dart';

class GameController extends GetxController {
  var playerMove = XOState.x.obs;
  var playerSide = XOState.x.obs;
  var gameIsEnd = false.obs;
  var count = 0.obs;
  void changePlayerMove() {
    if (gameIsEnd.value) return;
    if (count.value == 9) {
      gameIsEnd.value = true;
      return;
    }
    playerMove.value = playerMove.value == XOState.x ? XOState.o : XOState.x;
    count.value++;
  }
}
