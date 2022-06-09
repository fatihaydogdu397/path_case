import 'package:path_case/app/app_shelf.dart';
import 'package:path_case/views/char_detail/char_detail_viewmodel.dart';
import 'package:path_case/views/home/home_model.dart';

import '../../app/components/character_comics_list.dart';

class CharDetailView extends StatefulWidget {
  final Results selectedChar;
  const CharDetailView({
    Key? key,
    required this.selectedChar,
  }) : super(key: key);

  @override
  State<CharDetailView> createState() => _CharDetailViewState();
}

class _CharDetailViewState extends State<CharDetailView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CharDetailViewmodel>(
        onModelReady: (CharDetailViewmodel model) async {
          await model.initCharDetail(widget.selectedChar.id!);
        },
        onDispose: (CharDetailViewmodel model) {},
        builder: (context, model, child) {
          String imageUrl = widget.selectedChar.thumbnail?.path ?? '';
          String imageExtension = widget.selectedChar.thumbnail?.extension ?? '';
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 241, 241, 241),
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: context.lightTextColor,
                  )),
              backgroundColor: context.primaryColor,
              title: AutoSizeText(
                "${widget.selectedChar.name}",
                style: TextStyle(color: context.lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: model.charLoading
                ? loadingWidget(context)
                : SafeArea(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            charImage(context, imageUrl, imageExtension),
                            widget.selectedChar.description!.isNotEmpty
                                ? charDescription(context)
                                : Padding(
                                    padding: context.verticalMedium,
                                    child: const AutoSizeText(
                                      "There is no description for this character...",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                            Padding(
                              padding: context.horizontalMedium,
                              child: Divider(
                                color: context.primaryColor,
                              ),
                            ),
                            model.charDetailResult.isNotEmpty
                                ? Padding(
                                    padding: context.mediumEdgeInsets,
                                    child: CharacterComicList(model: model),
                                  )
                                : Padding(
                                    padding: context.verticalMedium,
                                    child: const AutoSizeText(
                                      "This character is not in a comic book yet...",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                          ],
                        ))),
          );
        });
  }

  Padding charDescription(BuildContext context) {
    return Padding(
      padding: context.mediumEdgeInsets,
      child: AutoSizeText(
        widget.selectedChar.description!,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: context.darkTextColor,
        ),
      ),
    );
  }

  Padding charImage(BuildContext context, String imageUrl, String imageExtension) {
    return Padding(
      padding: context.lowEdgeInsets * 2,
      child: Material(
        elevation: 7,
        borderRadius: context.lowCircular * 2,
        child: Container(
          height: context.height * 35,
          decoration: BoxDecoration(
            borderRadius: context.lowCircular * 2,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("$imageUrl.$imageExtension"),
            ),
          ),
        ),
      ),
    );
  }

  Column loadingWidget(BuildContext context) {
    return Column(children: [
      LinearProgressIndicator(
        color: context.primaryColor,
        backgroundColor: context.lightTextColor,
      ),
    ]);
  }
}
