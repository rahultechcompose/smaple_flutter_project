import 'dart:math';

class RandomModel{
  String _id;


  String get id => _id;

  set id(String value) {
    _id = value;
  }

  RandomModel(){
    _id=getRandomString(5);
  }



  String getRandomString(int length){
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}