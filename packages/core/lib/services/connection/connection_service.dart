import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService._();

  static Future<bool> checkHasConnect() async {
    final List<ConnectivityResult> connectivityResult = await Connectivity()
        .checkConnectivity();

    return connectivityResult.contains(ConnectivityResult.none);
  }

  static Stream<List<ConnectivityResult>> get onConnectChanged =>
      Connectivity().onConnectivityChanged;
}
