import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  NetworkService._privateConstructor();

  static final NetworkService instance = NetworkService._privateConstructor();

  final Connectivity _connectivity = Connectivity();

  Future<bool> get isConnected async {
    List<ConnectivityResult> connectivityResults =
        await _connectivity.checkConnectivity();
    return !connectivityResults.contains(ConnectivityResult.none);
  }

  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
