import 'package:flutter/cupertino.dart'; // 👈 Cupertino 위젯 사용을 위한 필수 import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/review.dart';
import 'package:movie_app/service/review_view_page.dart';
import 'package:movie_app/util/message.dart';

class ReviewWritePage extends StatefulWidget {
  const ReviewWritePage({super.key});

  @override
  State<ReviewWritePage> createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  late TextEditingController reviewController;
  late String movieTitle;
  late String movieActor;
  late String movieMannager;
  late String movieType;
  late String moviePoster;
  late int movieRunTime;
  late DateTime releaseDate;

  @override
  void initState() {
    super.initState();
    reviewController = TextEditingController();
    Message.addData();
    checkMovieInfoisEmpty();
  }

  void checkMovieInfoisEmpty() {
    if (Message.movieList.isEmpty) {
      movieTitle = '타이타닉';
      movieActor = '레오나르도 디카프리오';
      movieMannager = '제임스 카메론';
      movieType = '로맨스';
      moviePoster = 'images/titanic.png';
      movieRunTime = 195;
      releaseDate = DateTime(1998, 02, 20);
    } else {
      movieTitle = Message.movieList[Message.movieIndex].movieName;
      movieActor = Message.movieList[Message.movieIndex].actor;
      movieMannager = Message.movieList[Message.movieIndex].movieMannager;
      movieType = Message.movieList[Message.movieIndex].movieType;
      moviePoster = Message.movieList[Message.movieIndex].imagePath;
      movieRunTime = Message.movieList[Message.movieIndex].screenTime;
      releaseDate = Message.movieList[Message.movieIndex].releaseDate;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰 작성'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            title: const Text('리뷰할 영화 선택'),
                            message: const Text('목록에서 영화를 선택해 주세요.'),
                            actions: List.generate(
                              Message.movieList.length,
                              (index) => CupertinoActionSheetAction(
                                onPressed: () {
                                  // 선택한 인덱스를 저장
                                  Message.movieIndex = index;
                                  // 함수 호출
                                  checkMovieInfoisEmpty();
                                  // 액션시트 닫기
                                  Navigator.pop(context);
                                },
                                child: Text(Message.movieList[index].movieName),
                              ),
                            ),
                            cancelButton: CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('취소'),
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        moviePoster,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '제목 : $movieTitle',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '감독 : $movieMannager',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '주연 배우 : $movieActor',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '장르 : $movieType',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '상영 시간 : $movieRunTime분',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '개봉일 : ${releaseDate.toString().substring(0, 10)}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: reviewController,
                  maxLines: 1,
                  maxLength: 25,
                  decoration: InputDecoration(
                    hintText: '리뷰를 입력하세요.',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addReview();
                Get.back();
                Get.to(ReviewViewPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text('리뷰 등록'),
            ),
          ],
        ),
      ),
    );
  } // build

  // -------Function
  void addReview() {
    Message.reviewList.add(
      Review(
        reviewMovie: movieTitle,
        reviewText: reviewController.text,
      ),
    );
  }
}