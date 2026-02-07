import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/core/theme/color_pallet.dart';
import 'package:islami_app/models/sura_data.dart';

class QuranDetailsView extends StatefulWidget {
  static const routName = '/quran_details';

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> verses = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SuraData suraData = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (verses.isEmpty) {
      _loadQuranText(suraData.suraNumber);
    }
  }

  Future<void> _loadQuranText(String suraNumber) async {
    String quranText = await rootBundle.loadString(
      "assets/files/$suraNumber.txt",
    );
    setState(() {
      verses = quranText.trim().split("\n");
    });
  }

  @override
  Widget build(BuildContext context) {
    SuraData suraData = ModalRoute.of(context)!.settings.arguments as SuraData;

    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      appBar: AppBar(title: Text(suraData.suraNameEN)),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Assets.images.imgBottomDecoration.image(
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Assets.images.imgLeftCorner.image(width: 80),
                    Expanded(
                      child: Text(
                        suraData.suraNameAR,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: ColorPallete.primaryColor,
                              fontSize: 28,
                            ),
                      ),
                    ),
                    Assets.images.imgRightCorner.image(width: 80),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: verses.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorPallete.primaryColor,
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.only(
                            bottom: 100,
                            left: 8,
                            right: 8,
                          ),
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            TextSpan(
                              children: List.generate(verses.length, (index) {
                                return TextSpan(
                                  children: [
                                    TextSpan(
                                      text: " ${verses[index]} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: ColorPallete.primaryColor,
                                            height: 1.8,
                                            fontSize: 22,
                                          ),
                                    ),
                                    TextSpan(
                                      text: "(${index + 1})",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Janna',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                );
                              }),
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
