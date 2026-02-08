import 'package:flutter/material.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/core/theme/color_pallet.dart';
import 'package:islami_app/models/haidh_data.dart';

class HadithCardWidgets extends StatelessWidget {
  final HadithData hadithData;

  const HadithCardWidgets({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPallete.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Assets.images.hadithCardBackGround1.image(
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.images.imgLeftCorner.image(
                    width: 80,
                    color: Colors.black,
                  ),
                  Assets.images.imgRightCorner.image(
                    width: 80,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Assets.images.imgBottomDecoration.image(
              height: 60,
              fit: BoxFit.contain,
              color: Colors.black,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 60,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  hadithData.hadithTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                  child: Divider(color: Colors.black26, thickness: 1.5),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      hadithData.hadithBody,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black.withOpacity(0.85),
                        height: 1.6, // Better line spacing for readability
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
