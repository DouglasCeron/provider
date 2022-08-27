import 'package:flutter/foundation.dart';

class ChangeNotifierController extends ChangeNotifier {
  String name = 'Coding';
  String imgAvatar =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBmmlTMlJFDA_M-ZOV6G3r_Z0osf3otMw6dCDPlqRjCEwMzroouggUeZZfhxOqLCaHeeE&usqp=CAU';
  String birthDate = '01/01/2001';

  void alterarDados() {
    name = 'Dart';
    imgAvatar =
        'https://raw.githubusercontent.com/kevmoo/dart_side/master/Dash%20Dart%20PNG%20%20-%20white.png';
    birthDate = '10/10/2011';
    notifyListeners();
  }

  void alterarNome() {
    name = 'Flutter & Dart';
    notifyListeners();
  }
}
