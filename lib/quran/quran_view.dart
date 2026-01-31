import 'package:flutter/cupertino.dart';
import 'package:islami_app/core/gen/assets.gen.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.quranBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [Assets.images.headerLogo.image()]),
    );
  }
}
