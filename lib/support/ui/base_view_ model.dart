import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/support/enums/e_view_state.dart';
import 'package:weather_app/support/helpers/my_utils.dart';

/// Info
/// Use this when we have specific screen states, eg. loading, error, etc.
/// @shouldNotify stops the ui updating if it's already been disposed.  It appears default
/// behaviour doesn't stop this, and Providers get disposed behind the scenes.
class BaseViewModel extends ChangeNotifier {
  bool shouldNotify = true;

  String errorMessage = "";

  EViewState _state = EViewState.complete;

  EViewState get state => _state;

  bool get loadingOrError => state != EViewState.complete;

  bool get isLoading => state == EViewState.loading;

  bool get isComplete => state == EViewState.complete;

  bool get isError => state == EViewState.error;

  Future<bool> Function() get isNetworkError => MyUtils().isConnectedToNetwork;

  void setState(EViewState viewState) {
    _state = viewState;
    notify();
  }

  void setLoading() => setState(EViewState.loading);
  void setComplete() => setState(EViewState.complete);
  void setError() => setState(EViewState.error);

  void notify() {
    if (shouldNotify) {
      notifyListeners();
    }
  }

  bool checkErrorAndSetState(Response response) {
    if (response.statusCode != 200) {
      setState(EViewState.error);
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    shouldNotify = false;
    super.dispose();
  }
}
