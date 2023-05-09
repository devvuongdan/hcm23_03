// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

abstract class NetworkInfo {
  Future<bool>? get isConnected$;
}

class NetworkInfoImpl implements NetworkInfo {
  bool isConnected = false;
  late final StreamSubscription? connectionStream;

  void init() {
    return;
    // connectionStream = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.mobile ||
    //       result == ConnectivityResult.wifi) {
    //     isConnected = true;
    //   } else {
    //     isConnected = false;
    //   }
    // });
  }

  NetworkInfoImpl._internal();
  static NetworkInfoImpl? _instance;
  static NetworkInfoImpl get shared {
    _instance ??= NetworkInfoImpl._internal();

    return _instance!;
  }

  @override
  Future<bool>? get isConnected$ => NetworkInfoImpl.shared.isConnected$;
}
