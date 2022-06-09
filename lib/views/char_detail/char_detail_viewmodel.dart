import 'package:path_case/app/app_shelf.dart';
import 'package:path_case/app/services/character_detail_services.dart';
import 'package:path_case/views/char_detail/char_detail_model.dart';

class CharDetailViewmodel extends BaseModel {
  CharacterDetailServices characterDetailServices = CharacterDetailServices();

  bool charLoading = false;

  List<Result> charDetailResult = [];

  _switcDetailLoading() {
    charLoading = !charLoading;
    notifyListeners();
  }

  Future initCharDetail(int charId) async {
    _switcDetailLoading();
    setViewState(ViewState.Busy);
    charDetailResult = await getCharDetail(charId);
    _switcDetailLoading();
    setViewState(ViewState.Idle);
  }

  Future<List<Result>> getCharDetail(int charId) async {
    return (await characterDetailServices.getCharDetails(charId))?.data?.results ?? [];
  }
}
