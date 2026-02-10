import 'package:flutter/material.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/core/theme/color_pallet.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  int selectedIndex = 0;
  int playingIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.radioBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Assets.images.headerLogo.image(),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  _buildTabItem("Radio", 0),
                  _buildTabItem("Reciters", 1),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 4,
              itemBuilder: (context, index) {
                bool isPlaying = index == playingIndex;
                String title = "";
                if (selectedIndex == 0) {
                  List<String> radios = [
                    "Radio Ibrahim Al-Akdar",
                    "Radio Al-Qaria Yassen",
                    "Radio Ahmed Al-trabulsi",
                    "Radio Addokali Mohammad Alalim"
                  ];
                  title = radios[index];
                } else {
                  List<String> reciters = [
                    "Ibrahim Al-Akdar",
                    "Akram Alalaqmi",
                    "Majed Al-Enezi",
                    "Malik shaibat Alhamed"
                  ];
                  title = reciters[index];
                }

                return _buildRadioCard(title, index, isPlaying: isPlaying);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? ColorPallete.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioCard(String title, int index, {bool isPlaying = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 135,
      decoration: BoxDecoration(
        color: ColorPallete.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: isPlaying
                ? Opacity(
              opacity: 1.0,
              child: Assets.images.soundWaves.image(
                fit: BoxFit.fitWidth,
                height: 100,
              ),
            )
                : Opacity(
              opacity: 0.6,
              child: Assets.images.headerLogo.image(
                fit: BoxFit.cover,
                height: 90,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        playingIndex = isPlaying ? -1 : index;
                      });
                    },
                    child: Icon(
                      isPlaying ? Icons.pause_rounded : Icons
                          .play_arrow_rounded,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Icon(
                    isPlaying ? Icons.volume_up_rounded : Icons
                        .volume_off_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
