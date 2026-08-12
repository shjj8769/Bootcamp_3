import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/service/reserve_page.dart';
import 'package:movie_app/service/review_view_page.dart';
import 'package:movie_app/service/review_write_page.dart';
import 'package:movie_app/user/login_page.dart';
import 'package:movie_app/user/my_page.dart';
import 'package:movie_app/view/action_page.dart';
import 'package:movie_app/view/romance_page.dart';
import 'package:movie_app/view/thriller_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  // Property
  late TabController tabController;   // 상단 tabbarview
  late bool isLogin;
  final box = GetStorage();           // 인스턴스 추가


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    checkLogin();           // 시작할 때 로그인 정보가 기기에 있는지 체크
    // isLogin = false;
  }

  void checkLogin(){
    isLogin = box.read('isLogin') ?? false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cine Log'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: '액션'),
            Tab(text: '스릴러/공포'),
            Tab(text: '로맨스'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ActionPage(),       // 액션 탭
          ThrillerPage(),     // 스릴러/공포 탭
          RomancePage(),      // 로맨스 탭
        ]
      ),
      drawer: Drawer(
        child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: Icon(
                    Icons.account_circle,
                    color: Colors.white, 
                    size: 50
                  ),
                  currentAccountPictureSize: Size(10, 70),
                  accountName: Text(isLogin ? "admin님" : "로그인이 필요합니다."), 
                  accountEmail: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isLogin ? "admin@email.com" : ""),
                      SizedBox(
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: isLogin
                        ? ElevatedButton(
                          onPressed: () {
                            // 로그아웃
                            box.write('isLogin', false);
                            box.write('p_userId', "");
                            box.write('p_password', "");
                            // 상태 초기화 후 drawer닫고 로그인 페이지로 이동
                            checkLogin();
                            Navigator.pop(context); // 로그아웃 후 닫기
                          }, 
                          child: Text('로그아웃'),
                        )
                        : ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Get.to(() => LoginPage())!.then((value){
                              if(value == true){
                                checkLogin();
                                setState(() {});
                              }
                            });   // 로그인 페이지로 이동
                          }, 
                          child: Text('로그인')
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
                ElevatedButton(                   // 마이페이지 버튼
                  onPressed: () {
                    if(isLogin){
                      Get.to(MyPage());           // 마이페이지로 이동
                    }else{
                      errorDialog();
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 5,
                      ),
                      Text('마이페이지'),
                    ],
                  )
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(                       // 리뷰 작성 버튼
                  onPressed: () {
                    if(isLogin){
                      Get.to(ReviewWritePage());       // 리뷰 view페이지로 이동
                    }else{
                      errorDialog();
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 5,
                      ),
                      Text('리뷰 작성'),
                    ],
                  )
                ),
                  SizedBox(
                  height: 10,
                ),
                ElevatedButton(                       // 예약 버튼
                  onPressed: () {
                    if(isLogin){
                      Get.to(ReservePage());          // 예약 페이지로 이동
                    }else{
                      errorDialog();
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.confirmation_num),
                      SizedBox(
                        width: 5,
                      ),
                      Text('예매하기'),
                    ],
                  )
                ),
              ],
            )
          ),
    );
  } // build


  // =============== Function ================
  void errorDialog(){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              Text('경고'),
            ],
          ),
          content: Text('로그인을 해주세요.'),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.back(), 
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black
                    ),
                    child: Text('취소')
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // 다이얼 먼저 닫기
                      Get.to(() => LoginPage())!.then((value){
                        if(value == true){
                          checkLogin();
                        }
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[300],
                      foregroundColor: Colors.white
                    ),
                    child: Text("로그인 페이지 이동")
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
} // class
