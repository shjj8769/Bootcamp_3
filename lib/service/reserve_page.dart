import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/user/my_page.dart';
import 'package:movie_app/util/message.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  // Property
  late bool actionValue;   // 액션 장르 확인
  late bool thrillerValue; // 스릴러 장르 확인
  late bool romanceValue;  // 로맨스 장르 확인
  late String selectedDatePicker; // User가 선택한 날짜
  late DateTime date;             // 날짜
  late List<Movie> checkTypeMovieImage; // image출력 관리 리스트
  late int selectMovieIndex; // 선택된 포스터의 인덱스 값 확인

  @override
  void initState() {
    super.initState();
    actionValue = false;
    thrillerValue = false;
    romanceValue = false;
    Message.movieList = [];
    selectedDatePicker = '${DateTime.now().toString().substring(0, 10)}'; // 초기값을 현재 날짜로 조정
    date = DateTime.now();
    Message.addData();   // Message.moveList에 값 추가
    checkTypeMovieImage = []; 
    selectMovieIndex = -1;  // 초기에 선택된 값이 없게 하도록 하기 위해서 음수로 설정
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예매하기'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 300,
                child: OutlinedButton(
                  onPressed: (){
                    datePick();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(4)
                    )
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.purple,
                      ),
                      Text(selectedDatePicker),
                    ],
                  )
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: actionValue, 
                  onChanged: (value){
                    actionValue = !actionValue;
                    checkType();
                  }
                ),
                Text('액션'),
                Checkbox(
                  value: thrillerValue, 
                  onChanged: (value) {
                    thrillerValue = !thrillerValue;
                    checkType();
                  }
                ),
                Text('스릴러'),
                Checkbox(
                  value: romanceValue, 
                  onChanged: (value) {
                    romanceValue = !romanceValue;
                    checkType();
                  }
                ),
                Text('로맨스')
              ],
            ),
            Text('상영중인 영화 ${checkTypeMovieImage.length}편'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 400,
                  child: Container(
                    child: ListView.builder(
                      itemCount: checkTypeMovieImage.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              selectMovieIndex = index;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectMovieIndex == index ? Colors.yellow : Colors.white,
                                  width: 3
                                ),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: Image.asset(
                                checkTypeMovieImage[index].imagePath,
                              ),
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 350,
                height: 70,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purpleAccent),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(
                    '예매 정보\n예매일 : ${selectedDatePicker}\n영화 제목 : ${selectMovieIndex != -1 ? checkTypeMovieImage[selectMovieIndex].movieName : '선택 안됨'}'
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Get.back();
                  Get.to(MyPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(4)
                  ),
                ),
                child: Text('예매하기')
              ),
            ),
          ],
        ),
      ),
    );
  }// Build
  // ----Functions
  void datePick()async{   // 사용자가 날짜 선택을 가능하게 하는 함수
    int firstYear = date.year;
    int lastYear = firstYear + 1;

    final selectedDate = await showDatePicker(
      context: context, 
      firstDate: DateTime(firstYear), 
      lastDate: DateTime(lastYear),
    );
    if(selectedDate !=  null){
      selectedDatePicker = '${selectedDate.toString().substring(0,10)}';
    }
    setState(() {});
  }

  void checkType(){      // 사용자가 선택한 장르의 포스터만 출력
    selectMovieIndex = -1; // 사용자 선택 값 초기화
    checkTypeMovieImage = []; // 계속 추가 되는 상황 방지
    for (var movie in Message.movieList) {
      if(actionValue && movie.movieType == '액션'){ 
        checkTypeMovieImage.add(movie);  // 액션 장르 선택 시 액션 장르를 movieType으로 가지고 있는 영화의 imagePath를 가져옴
      }
      if(romanceValue && movie.movieType == '로맨스'){
        checkTypeMovieImage.add(movie);
      }
      if(thrillerValue && movie.movieType == '스릴러'){
        checkTypeMovieImage.add(movie);
      }
    }
    setState(() {});
  }
}// Class