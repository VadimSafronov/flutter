// Счетчик
class Counter {

  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
// сложение
class WeTest{
  String text= "This laba made by Vadim, this number is: ";
  populateText(int a,int b){
    int value = a+b;
    text=text+value.toString();
  }
}