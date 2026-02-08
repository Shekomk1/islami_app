import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/hadith/widgets/hadith_card_widgets.dart';
import 'package:islami_app/models/haidh_data.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  List<HadithData> hadithList = [];

  @override
  void initState() {
    super.initState();
    _loadHadithText();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.hadithBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          children: [
            Assets.images.headerLogo.image(),
            const SizedBox(height: 20,),
            if (hadithList.isEmpty)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else
              CarouselSlider(
                  items: hadithList
                      .map((e) => HadithCardWidgets(hadithData: e))
                      .toList(),
                  options: CarouselOptions(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.62,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(
                        milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ))
          ]
      ),
    );
  }

  Future<void> _loadHadithText() async {
    List<HadithData> tempHadithList = [];
    for (int i = 1; i <= 50; i++) {
      String hadithText = await rootBundle.loadString(
        'assets/files/hadith/h$i.txt',
      );
      int titleLength = hadithText.trim().indexOf('\n');
      if (titleLength == -1) continue;

      String hadithTitle = hadithText.substring(0, titleLength).trim();
      String hadithBody = hadithText.substring(titleLength).trim();

      tempHadithList.add(HadithData(
        hadithTitle: hadithTitle,
        hadithBody: hadithBody,
      ));
    }
    setState(() {
      hadithList = tempHadithList;
    });
  }
}
