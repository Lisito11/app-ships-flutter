import 'package:flutter/material.dart';

class SwitchProvider with ChangeNotifier{
  bool _isSwitched = false;
  bool get isSwitched =>  this._isSwitched;

  set isSwitched (bool valor){
    this._isSwitched = valor;
    notifyListeners();
  }
}