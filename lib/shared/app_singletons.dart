class NetworkSingletonImpl implements NetworkSingleton {
  NetworkSingletonImpl._internal();
  static NetworkSingletonImpl? _instance;

  static NetworkSingletonImpl get shared {
    _instance ??= NetworkSingletonImpl._internal();

    return _instance!;
  }

  bool isLoading = false;
  bool get isShowingLoading$ => isLoading;

  @override
  bool? get isShowingLoading => isShowingLoading$;
}

abstract class NetworkSingleton {
  bool? get isShowingLoading;
}
