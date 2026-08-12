import 'package:flutter/material.dart';
import 'package:movie_app/model/review.dart';

class ReviewViewPage extends StatefulWidget {
  const ReviewViewPage({super.key});

  @override
  State<ReviewViewPage> createState() => _ReviewViewPageState();
}

class _ReviewViewPageState extends State<ReviewViewPage> {
  late List<Review> reviewList;
  late List<Review> hideReviewList;

  @override
  void initState() {
    super.initState();
    reviewList = [];
    hideReviewList = [];
  }
  
  
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
            Text('등록된 리뷰 ${reviewList.length}개'),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: reviewList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(reviewList[index].reviewName),
                        ],
                      ),
                      Text(reviewList[index].reviewMovie),
                      Text(reviewList[index].reviewText),
                    ],
                  ),
                );
              }
            ),
            Container(
              child: Text('숨김 처리된 리뷰는 ${hideReviewList.length}개는 \n이 목록에 표시되지 않습니다.'),
            )
          ],
        ),
      ),
    );
  }
}