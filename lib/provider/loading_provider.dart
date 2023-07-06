import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _isloading = false;
  bool get isLoading => _isloading;

  void setLoading(bool isLoading) {
    _isloading = isLoading;
    notifyListeners();
  }
}
