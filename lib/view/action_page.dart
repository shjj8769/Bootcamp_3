import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/service/review_view_page.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({super.key});

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
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
      'images/spiderman.png',
      'images/odyssey.png',
      'images/theoutlaws.png',
    ];
    movieName = ['스파이더맨: 브랜드 뉴 데이', '오디세이', '범죄도시4'];
    movieActor = ['톰 홀랜드, 2026.07.29', '맷 데이먼, 2026.08.05', '마동석, 2024.04.24'];
    movieInfo = ['액션, 145분, 12세', '액션, 172분, 15세', '액션, 109분, 15세'];
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