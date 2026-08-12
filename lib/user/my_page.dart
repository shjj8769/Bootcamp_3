import 'package:flutter/material.dart';
import 'package:movie_app/model/reservation.dart';
import 'package:movie_app/util/message.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late bool reviewcheck;

  @override
  void initState() {
    super.initState();
    reviewcheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text(
            '내 예매내역',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 18,
            ),
          ),
            SizedBox(
              height: 200, // 최대 높이 설정
              child: ListView.builder(
                itemCount: Message.reserveList.length,
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
                        child: Row(
                          children: [
                            Icon(Icons.confirmation_num),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Message.reserveList[index].movieName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  Message.reserveList[index].reserveDate,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '내가 작성한 리뷰',
                style: TextStyle(
                  color:  Colors.deepPurpleAccent,
                  fontSize: 18
                ),
              ),
            ],
          ),
            SizedBox(
              height: 200, // 최대 높이 설정
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
    );
  }
}