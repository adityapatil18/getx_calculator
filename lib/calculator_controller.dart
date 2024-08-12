import 'package:get/get.dart';

class CalculationController extends GetxController {
  //Current operator
  final RxString _currentSign = "+".obs;
  RxString get currentSign => _currentSign;

  //First operand
  final RxInt _numOne = 0.obs;
  RxInt get numOne => _numOne;

  //Second operand
  final RxInt _numTwo = 0.obs;
  RxInt get numTwo => _numTwo;

  //Result of the operation
  final RxInt _result = 0.obs;
  RxInt get result => _result;

  void increaseNumOne() {
    print(_numOne.value);
    _numOne.value++;
  }

  void increaseNumTwo() {
    _numTwo.value++;
  }

  void decreaseNumOne() {
    _numOne.value--;
  }

  void decreaseNumTwo() {
    _numTwo.value--;
  }

  void add() {
    _currentSign.value = "+";
    _result.value = _numOne.value + _numTwo.value;
  }

  void subtract() {
    _currentSign.value = "-";
    _result.value = _numOne.value - _numTwo.value;
  }

  void multiply() {
    _currentSign.value = "x";
    _result.value = _numOne.value * _numTwo.value;
  }

  void divide() {
    _currentSign.value = "/";
    _result.value = _numOne.value ~/ _numTwo.value;
  }

  void reset() {
    _numOne.value = 0;
    _numTwo.value = 0;
    _result.value = 0;
  }
}
