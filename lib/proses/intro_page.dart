import 'package:Policy_Centre_Point/main.dart';
import 'package:Policy_Centre_Point/warna.dart';
import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/proses/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(IntroApp());

class IntroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'title': 'Welcome to Policy Centre Point!',
      'description': 'Discover the amazing features of our app.',
      'image': 'assets/images/welcome_page/welcome(1).png',
    },
    {
      'title': 'Easy to Use',
      'description': 'Intuitive and user-friendly interface.',
      'image': 'assets/images/welcome_page/welcome(2).png',
    },
    {
      'title': 'Get Started',
      'description': 'Sign up or log in to start using the app.',
      'image': 'assets/images/welcome_page/welcome(3).png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _slides.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(_slides[index]['image']!),
                    SizedBox(height: 20.0),
                    Text(
                      _slides[index]['title']!,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'URW',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      _slides[index]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, fontFamily: 'URW'),
                    ),
                  ],
                );
              },
            ),
          ),
          // Page Dots Indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _slides.length,
              effect: WormEffect(
                activeDotColor: Warna.Primary,
                dotColor: Colors.grey,
                spacing: 8.0,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _currentPage == _slides.length - 1
          ? Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontFamily: 'URW'),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Warna.Primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
