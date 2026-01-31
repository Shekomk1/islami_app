import 'package:flutter/cupertino.dart';
import 'package:islami_app/core/gen/assets.gen.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.hadithBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(children: [Assets.images.headerLogo.image()]),
    );
  }
}
