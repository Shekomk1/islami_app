import 'package:flutter/material.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/hadith/hadith_view.dart';
import 'package:islami_app/quran/quran_view.dart';
import 'package:islami_app/radio/radio_view.dart';
import 'package:islami_app/sebha/sebha_view.dart';
import 'package:islami_app/time/time_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedBottomBarIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadithView(),
    SebhaView(),
    RadioView(),
    TimeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedBottomBarIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomBarIndex,
        onTap: (index) {
          setState(() {
            selectedBottomBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.quranInActiveIcn.svg(width: 25, height: 25),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.quranActiveIcn.svg(width: 25, height: 25),
              // child: SvgPicture.asset('assets/icons/quran_active_icn.svg')
            ),
            label: 'Quran',
          ),

          BottomNavigationBarItem(
            icon: Assets.icons.hadithInActiveIcn.svg(width: 25, height: 25),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.hadithActiveIcn.svg(width: 25, height: 25),
            ),
            label: 'Hadith',
          ),

          BottomNavigationBarItem(
            icon: Assets.icons.sebhaInActiveIcn.svg(width: 25, height: 25),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.sebhaActiveIcn.svg(width: 25, height: 25),
            ),
            label: 'Sebha',
          ),

          BottomNavigationBarItem(
            icon: Assets.icons.radioInActiveIcn.svg(width: 25, height: 25),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.radioActiveIcn.svg(width: 25, height: 25),
            ),
            label: 'Radio',
          ),

          BottomNavigationBarItem(
            icon: Assets.icons.timeInActiveIcn.svg(width: 25, height: 25),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Assets.icons.timeActiveIcn.svg(width: 25, height: 25),
            ),

            label: 'Time',
          ),
        ],
      ),
    );
  }
}
