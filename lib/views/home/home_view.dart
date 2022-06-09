import 'package:path_case/app/app_shelf.dart';
import 'package:path_case/app/components/character_list.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewmodel>(
        onModelReady: (HomeViewmodel model) async {
          await model.initCharacters();
          model.scrollController.addListener(() async {
            if (model.scrollController.position.atEdge) {
              bool isEnd = model.scrollController.position.pixels == model.scrollController.position.maxScrollExtent;
              if (isEnd) {
                await model.onPageBottomCharacters();
              }
            }
          });
        },
        onDispose: (HomeViewmodel model) {},
        builder: (context, model, child) {
          return Scaffold(
              body: model.loading
                  ? SafeArea(
                      child: Column(children: [
                        LinearProgressIndicator(
                          color: context.primaryColor,
                          backgroundColor: context.lightTextColor,
                        )
                      ]),
                    )
                  : SafeArea(
                      child: Stack(
                        children: [
                          CharacterList(model: model),
                          model.scrollLoading
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    LinearProgressIndicator(
                                      color: context.primaryColor,
                                      backgroundColor: context.lightTextColor,
                                    )
                                  ],
                                )
                              : const SizedBox()
                        ],
                      ),
                    ));
        });
  }
}
