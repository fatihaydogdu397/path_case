import '../../app/app_shelf.dart';
import '../../app/services/character_services.dart';
import 'home_model.dart';

class HomeViewmodel extends BaseModel {
  final scrollController = ScrollController();
  CharacterServices characterServices = CharacterServices();
  bool scrollLoading = false;
  bool loading = false;
  int offset = 0;

  List<Results> result = [];

  void _switchLoading() {
    loading = !loading;
    notifyListeners();
  }

  void _switchScrollLoading() {
    scrollLoading = !scrollLoading;
    notifyListeners();
  }

  Future<void> initCharacters() async {
    _switchLoading();
    setViewState(ViewState.Busy);
    result = await getCharacters();
    _switchLoading();
    setViewState(ViewState.Idle);
  }

  Future<void> onPageBottomCharacters() async {
    _switchScrollLoading();
    setViewState(ViewState.Busy);
    offset = offset + 1;
    final List<Results> loadedList = (await characterServices.getCharacter(offset))?.data?.results ?? [];
    result.addAll(loadedList);
    _switchScrollLoading();
    setViewState(ViewState.Idle);
  }

  Future<List<Results>> getCharacters() async {
    return (await characterServices.getCharacter(offset))?.data?.results ?? [];
  }
}
