import 'package:path_case/app/router/app_router.dart';

import '../../views/home/home_viewmodel.dart';
import '../app_shelf.dart';

class CharacterList extends StatelessWidget {
  final HomeViewmodel? model;
  const CharacterList({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: model?.scrollController,
      itemCount: model?.result.length ?? 0,
      itemBuilder: (context, index) {
        String imageUrl = model?.result[index].thumbnail?.path ?? '';
        String imageExtension = model?.result[index].thumbnail?.extension ?? '';
        return Container(
          height: context.height * 25,
          padding: context.mediumEdgeInsets,
          child: Material(
            elevation: 6,
            borderRadius: context.highCircular,
            child: ClipRRect(
              borderRadius: context.highCircular,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/details', arguments: model?.result[index]);
                },
                child: Row(
                  children: [
                    charImage(context, imageUrl, imageExtension),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        charName(context, index),
                        charDescription(context, index),
                        const Spacer(),
                        moreInfo(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Image charImage(BuildContext context, String imageUrl, String imageExtension) {
    return Image(
      width: context.width * 40,
      height: context.height * 25,
      fit: BoxFit.cover,
      image: NetworkImage("$imageUrl.$imageExtension"),
    );
  }

  SizedBox moreInfo(BuildContext context) {
    return SizedBox(
      width: context.width * 50,
      child: Padding(
        padding: context.lowEdgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText("Read more",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: context.primaryColor,
                )),
            SizedBox(width: 10),
            Icon(
              Icons.double_arrow_sharp,
              color: context.primaryColor,
            )
          ],
        ),
      ),
    );
  }

  Row charDescription(BuildContext context, int index) {
    return Row(
      children: [
        Padding(
          padding: context.lowEdgeInsets,
          child: SizedBox(
            width: context.width * 50,
            child: AutoSizeText(
              "${model?.result[index].description}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                color: context.darkTextColor,
              ),
              overflow: TextOverflow.fade,
              maxLines: 5,
              minFontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Row charName(BuildContext context, int index) {
    return Row(
      children: [
        Padding(
          padding: context.lowEdgeInsets,
          child: SizedBox(
            width: context.width * 50,
            child: AutoSizeText(
              "${model?.result[index].name}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: context.darkTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
