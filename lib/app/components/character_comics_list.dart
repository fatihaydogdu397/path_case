import '../../views/char_detail/char_detail_viewmodel.dart';
import '../app_shelf.dart';

class CharacterComicList extends StatelessWidget {
  final CharDetailViewmodel model;
  const CharacterComicList({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: model.charDetailResult.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: context.verticalLow / 2,
            child: Center(
              child: ListTile(
                title: AutoSizeText(
                  "${model.charDetailResult[index].title}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: context.darkTextColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
