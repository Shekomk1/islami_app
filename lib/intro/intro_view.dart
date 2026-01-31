import 'package:flutter/material.dart';
import 'package:islami_app/splash/HomeView.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'assets/images/intro/Intro Screen1.png',
    'assets/images/intro/Intro Screen2.png',
    'assets/images/intro/Intro Screen3.png',
    'assets/images/intro/Intro Screen4.png',
    'assets/images/intro/Intro Screen5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.amber : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            right: 20,
            child: TextButton(
              onPressed: () {
                if (currentIndex == images.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeView()),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                currentIndex == images.length - 1 ? 'Finish' : 'Next',
                style: const TextStyle(color: Colors.amber, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
