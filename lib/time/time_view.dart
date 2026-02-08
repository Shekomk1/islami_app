import 'package:flutter/material.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/core/theme/color_pallet.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.timeBackground.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Assets.images.headerLogo.image(height: 140),

              const SizedBox(height: 10),

              _buildPrayTimeCard(context),

              const SizedBox(height: 30),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Azkar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildAzkarCard(
                        "Evening Azkar",
                        Assets.images.eveningImg.image(),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildAzkarCard(
                        "Morning Azkar",
                        Assets.images.morningImg.image(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayTimeCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF856B3F).withOpacity(0.9),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
              color: ColorPallete.primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDateText("16 Jul,\n2024"),
                      Column(
                        children: [
                          const Text(
                            "Pray Time",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Tuesday",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      _buildDateText("09 Muh,\n1446"),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      _buildTimeBox("Sunrise", "05:04", false),
                      _buildTimeBox("Dhuhr", "01:01", false),
                      _buildTimeBox("ASR", "04:38", true),
                      _buildTimeBox("Maghrib", "07:57", false),
                      _buildTimeBox("Isha", "09:12", false),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next Pray - 02:32",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.volume_off_rounded,
                      color: Colors.black,
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTimeBox(String label, String time, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.symmetric(
        vertical: isActive ? 22 : 15,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: isActive ? null : Colors.black.withOpacity(0.2),
        gradient: isActive
            ? const LinearGradient(
                colors: [Color(0xFF2E2E2E), Color(0xFF555555)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "PM",
            style: TextStyle(
              color: isActive ? Colors.white70 : Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAzkarCard(String title, Widget image) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: ColorPallete.primaryColor, width: 2.5),
      ),
      child: Column(
        children: [
          SizedBox(height: 180, child: image),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
