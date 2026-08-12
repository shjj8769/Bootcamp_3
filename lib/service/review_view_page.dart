import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/review.dart';
import 'package:movie_app/util/message.dart';

class ReviewViewPage extends StatefulWidget {
  const ReviewViewPage({super.key});

  @override
  State<ReviewViewPage> createState() => _ReviewViewPageState();
}

class _ReviewViewPageState extends State<ReviewViewPage> {
  late List<Review> reviewList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('영화 리뷰'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500, // 최대 높이 설정
              child: ListView.builder(
                itemCount: Message.reviewList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 350,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                Text('작성자 : User')
                              ],
                            ),
                            Text(
                              '영화 제목 : ${Message.reviewList[index].reviewMovie}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '리뷰 내용 : ${Message.reviewList[index].reviewText}',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}