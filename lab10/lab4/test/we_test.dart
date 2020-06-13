
import 'package:flutter_test/flutter_test.dart';
import 'package:lab4/counter.dart';

// Выполняем проверки с помощью метода expect
void main(){
  test("text string should change",(){
    final weTest=WeTest();
    weTest.populateText(5, 5);
    expect(weTest.text, "This laba made by Vadim, this number is: 10");
  });
}