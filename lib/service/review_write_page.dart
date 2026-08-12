import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/service/review_view_page.dart';

class ReviewWritePage extends StatefulWidget {
  const ReviewWritePage({super.key});

  @override
  State<ReviewWritePage> createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  //Property
  late TextEditingController reviewController;   // 리뷰 작성
  late String reviewText;

  @override
  void initState() {
    super.initState();
    reviewController = TextEditingController();
    reviewText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('리뷰 작성')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 300,
                child: Image.asset(
                  'images/spiderman.png',
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                  '스파이더맨: 브랜드 뉴 데이',
                  style: TextStyle(
                    fontSize: 16
                  ),
                    ),
                    Text(
                  '액션, 145분\n' 
                  '감독: 데스트 다니엘 크레톤\n'
                  '출연: 톰 홀랜드\n'
                  '개봉: 2026.07.29'
                ),
                  ],
                )
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextField(
                    controller: reviewController,
                    decoration: InputDecoration(
                      labelText: '리뷰를 남겨보세요',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  reviewText = reviewController.text.trim();
                },
                child: Text('등록')
              )
            ],
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () => Get.to(ReviewViewPage()),
            child: Text('리뷰 보러가기')
            )
        ],
      ),
    );
  }
}