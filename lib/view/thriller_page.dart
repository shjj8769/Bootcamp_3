import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/service/review_view_page.dart';

class ThrillerPage extends StatefulWidget {
  const ThrillerPage({super.key});

  @override
  State<ThrillerPage> createState() => _ThrillerPageState();
}

class _ThrillerPageState extends State<ThrillerPage> {
  //Property
  late List<String> movieImage; // 영화포스터 사진
  late List<String> movieName; // 영화 제목
  late List<String> movieActor; // 영화배우 및 개봉일
  late List<String> movieInfo; // 영화정보
  late int movieNum; // 리스트인덱스

  @override
  void initState() {
    super.initState();
    movieImage = [
      'images/backroom.png',
      'images/getout.png',
      'images/salmokji.png',
    ];
    movieName = ['백룸', '겟아웃', '살목지'];
    movieActor = [
      '추이텔 에지오프, 2026.05.27',
      '대니얼 칼루야, 2017.05.17',
      '김혜윤, 2026.04.08',
    ];
    movieInfo = ['스릴러/공포, 110분, 15세', '스릴러/공포, 104분, 15세', '스릴러/공포, 95분, 15세'];
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
                    Text(movieActor[index], style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Get.to(ReviewViewPage());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50, 40),
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, size: 30, color: Colors.white),
                  Text(
                    '리뷰 보기',
                    style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}