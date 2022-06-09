import '../app_shelf.dart';

class BaseModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;

  ViewState get viewState => _viewState;
  bool get isIdle => _viewState == ViewState.Idle;
  bool get isBusy => _viewState == ViewState.Busy;

  void setViewState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }
}
