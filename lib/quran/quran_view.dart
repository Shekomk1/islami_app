import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:islami_app/core/extension/padding_extension.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/core/theme/color_pallet.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/quran/widgets/SuraCardWidgets.dart';
import 'package:islami_app/quran/widgets/quran_details_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranView extends StatefulWidget {
  QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  List<SuraData> suraList = [];
  List<SuraData> filterSuraList = [];
  List<SuraData> recentSuras = [];

  final List<String> arabicAuranSuras = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  final List<String> englishQuranSurahs = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];
  final List<String> ayaNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];

  @override
  void initState() {
    super.initState();
    suraList = List.generate(arabicAuranSuras.length, (index) =>
        SuraData(
          suraNumber: "${index + 1}",
          suraNameAR: arabicAuranSuras[index],
          suraNameEN: englishQuranSurahs[index],
          suraVersesCount: ayaNumber[index],
        ),
    );
    filterSuraList = suraList;
    _loadRecentSuras();
  }

  Future<void> _loadRecentSuras() async {
    final prefs = await SharedPreferences.getInstance();
    final String? recentJson = prefs.getString('recent_suras');
    if (recentJson != null) {
      List<dynamic> decoded = jsonDecode(recentJson);
      setState(() {
        recentSuras = decoded.map((e) => SuraData.fromJson(e)).toList();

        if (recentSuras.length > 5) {
          recentSuras = recentSuras.sublist(0, 5);
        }
      });
    }
  }

  Future<void> _saveRecentSura(SuraData sura) async {
    final prefs = await SharedPreferences.getInstance();
    recentSuras.removeWhere((element) => element.suraNumber == sura.suraNumber);
    recentSuras.insert(0, sura);
    if (recentSuras.length > 5) {
      recentSuras.removeLast();
    }
    await prefs.setString('recent_suras',
        jsonEncode(recentSuras.map((e) => e.toJson()).toList()));
    setState(() {});
  }

  void _onSearch(String query) {
    setState(() {
      filterSuraList = suraList.where((sura) {
        return sura.suraNameAR.contains(query) ||
            sura.suraNameEN.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: ColorPallete.primaryColor,
        image: DecorationImage(
          image: Assets.images.quranBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 12),
              child: Assets.images.headerLogo.image(),
            ),
            TextField(
              onChanged: _onSearch,
              cursorColor: ColorPallete.primaryColor,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Sura Name',
                hintStyle: const TextStyle(
                  color: ColorPallete.generalTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorPallete.primaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorPallete.primaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorPallete.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.quranActiveIcn.svg(
                    colorFilter: const ColorFilter.mode(
                      ColorPallete.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ).setHorizontalPaddingOnWidget(20),
            if (recentSuras.isNotEmpty &&
                filterSuraList.length == suraList.length) ...[
              Text("Most Recently ",
                  style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white)
              ).setHorizontalPaddingOnWidget(20),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: recentSuras.length,
                  itemBuilder: (context, index) {
                    final sura = recentSuras[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          QuranDetailsView.routName,
                          arguments: sura,
                        );
                      },
                      child: Container(
                          width: 280,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorPallete.primaryColor,
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        sura.suraNameEN,
                                        style: theme.textTheme.headlineSmall
                                            ?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text(
                                        sura.suraNameAR,
                                        style: theme.textTheme.headlineSmall
                                            ?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text(
                                        "${sura.suraVersesCount} Verses",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(color: Colors.black)
                                    ),
                                  ],
                                ),
                              ),
                              Assets.images.imgMostRecent.image(),
                            ],
                          )
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 15),
                ),
              ),
            ],
            Text("Suras List",
                style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white)
            ).setHorizontalPaddingOnWidget(20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: filterSuraList.length,
              itemBuilder: (context, index) {
                return Suracardwidgets(
                  suraData: filterSuraList[index],
                  onTap: () {
                    _saveRecentSura(filterSuraList[index]);
                    Navigator.of(context).pushNamed(
                      QuranDetailsView.routName,
                      arguments: filterSuraList[index],
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                    color: Colors.white24,
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                    height: 30
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
