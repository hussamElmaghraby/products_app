import 'dart:io';
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusSingleton {
  static final ConnectionStatusSingleton _singleton =
      ConnectionStatusSingleton._internal();

  ConnectionStatusSingleton._internal();

  static ConnectionStatusSingleton getInstance() => _singleton;

  bool hasConnection = false;

  final Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    try {
      final ConnectivityResult result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        hasConnection = false;
      } else {
        hasConnection = true;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    return hasConnection;
  }
}
