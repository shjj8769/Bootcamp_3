import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/service/review_view_page.dart';

class RomancePage extends StatefulWidget {
  const RomancePage({super.key});

  @override
  State<RomancePage> createState() => _RomancePageState();
}

class _RomancePageState extends State<RomancePage> {
  //Property
  late List<String> movieImage;
  late List<String> movieName;
  late List<String> movieActor;
  late List<String> movieInfo;
  late int movieNum;

  @override
  void initState() {
    super.initState();
    movieImage = [
      'images/titanic.png',
      'images/abouttime.png',
      'images/oncewewereus.png',
    ];
    movieName = ['타이타닉', '어바웃타임', '만약에우리'];
    movieActor = [
      '레오나르도 디카프리오, 1998.02.20',
      '도널 글리슨, 2013.12.05',
      '구교환, 2025.12.31',
    ];
    movieInfo = ['로맨스, 195분, 15세', '로맨스, 123분, 15세', '로맨스, 115분, 15세'];
    movieNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                movieImage[movieNum],
                width: 350,
                height: 600,
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 490,
                left: 10,
                child: Column(
                  children: [
                    Text(
                      movieName[movieNum],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      movieInfo[movieNum],
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CupertinoPicker(
            itemExtent: 60,
            onSelectedItemChanged: (value) {
              movieNum = value;
              setState(() {});
            },
            children: List.generate(
              movieImage.length,
              (index) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movieName[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(movieActor[index], style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(ReviewViewPage());
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(50, 60),
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message, size: 30),
                Text(
                  '리뷰 보기',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}