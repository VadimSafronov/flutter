import 'package:lab4/MathOperations.dart';
import 'package:test/test.dart';
// тестим наши мат операции
void main() {
  group('Calculator', () {
    test('Sum check', () {
      expect(Math().sum(2, 1),3); // Выполняем проверки с помощью метода expect
    });

    test('Diff Check', () {
      expect(Math().diff(2, 1),1);
    });

    test('Compos Check', () {
      expect(Math().compos(2, 1),2);
    });

    test('Div Check', () {
      expect(Math().div(2, 1),2);
    });
  });
}