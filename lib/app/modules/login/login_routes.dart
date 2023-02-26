import 'package:flutter_modular/flutter_modular.dart';

class LoginRoutes {

  static goToHome(){
    Modular.to.navigate('/home/');
  }

  static pop(){
    Modular.to.pop();
  }
}