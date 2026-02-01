import 'package:flutter/material.dart';
import 'package:islami_app/core/extension/padding_extension.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/core/theme/color_pallet.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPallete.primaryColor,
        image: DecorationImage(
          image: Assets.images.quranBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Assets.images.headerLogo.image(),
          ),
          TextField(
            cursorColor: ColorPallete.primaryColor,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: TextStyle(
                color: ColorPallete.generalTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Assets.icons.quranActiveIcn
                  .svg(
                colorFilter: ColorFilter.mode(
                  ColorPallete.primaryColor,
                  BlendMode.srcIn,
                ),
              )
                  .setHorizontalPaddingOnWidget(12),
            ),
          ),
          SizedBox(height: 10),
          Text("Most Recentely ",
              style: TextStyle(
                color: ColorPallete.generalTextColor,
                fontSize: 16,
              )),


        ],
      ).setHorizontalPaddingOnWidget(20),
    );
  }
}