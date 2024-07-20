import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final List<String> _imgPath = [
    "./assets/carousel_1.png",
    "./assets/carousel_2.png",
    "./assets/carousel_3.png",
  ];

  int _currentImg = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _imgPath.map((e) => 
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(e, fit: BoxFit.cover,),
              ),
            )
          ).toList(),
          options: CarouselOptions(
            initialPage: 1,
            aspectRatio: 2.0,
            autoPlay: true,
            autoPlayInterval: const Duration(milliseconds: 4500),
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
            onPageChanged: (index, _) {
              setState(() {
                _currentImg = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10.0,),
        buildCarouselIndicator(),
      ],
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < _imgPath.length; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            height: i == _currentImg? 7 : 5,
            width: i == _currentImg? 7 : 5,
            decoration: BoxDecoration(
              color: i == _currentImg? Colors.black :Colors.grey,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}