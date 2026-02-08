import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/core/gen/assets.gen.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  int _counter = 0;
  int _tasbihIndex = 0;
  double _angle = 0;
  final List<String> _tasbihat = const ["سبحان الله", "الحمد لله", "الله أكبر"];

  void _onSebhaTapped() {
    setState(() {
      _counter++;
      _angle += (360 / 33);

      if (_counter == 33) {
        _counter = 0;
        _tasbihIndex = (_tasbihIndex + 1) % _tasbihat.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.sebhaBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Assets.images.headerLogo.image(),

          const SizedBox(height: 10),

          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          Center(
            child: GestureDetector(
              onTap: _onSebhaTapped,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: _angle * (pi / 180),
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/images/body_sebha.png',
                          width: size.width * 0.75,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: -size.height * 0.1,
                          child: Image.asset(
                            'assets/images/head_sebha.png',
                            height: size.height * 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _tasbihat[_tasbihIndex],
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "$_counter",
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
