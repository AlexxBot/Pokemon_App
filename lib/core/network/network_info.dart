import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  String get url;

  set url(String newValue);
  int get timeOut;

  get isConnected => null;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  String _url;
  final int _timeOut;
  NetworkInfoImpl(this.connectivity, this._url, [this._timeOut = 20]);

  @override
  Future<bool> get isConnected => isConnectedToNetwork();

  @override
  String get url => _url;

  @override
  set url(String newValue) {
    _url = newValue;
  }

  @override
  int get timeOut => _timeOut;

  Future<bool> isConnectedToNetwork() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
      return _updateConnectionStatus(result);
    } on Exception {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        /* case ConnectivityResult.none: */
        return true;
      default:
        return false;
    }
  }
}
