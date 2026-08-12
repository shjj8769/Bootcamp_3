import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/service/reserve_page.dart';
import 'package:movie_app/service/review_view_page.dart';
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


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    isLogin = false;
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
            Tab(
              text: '액션',
            ),
            Tab(
              text: '스릴러/공포',
            ),
            Tab(
              text: '로맨스',
            ),
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
              accountName: Text("UserName"), 
              accountEmail: Row(
                children: [
                  Text("user@email.com"),
                  SizedBox(
                    width: 70,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(LoginPage());
                    }, 
                    child: Text('로그인')
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
            ),
            ElevatedButton(
              onPressed: () {
                if(isLogin == true){
                  Get.to(MyPage());
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
            ElevatedButton(
              onPressed: () {
                if(isLogin == true){
                  Get.to(ReviewViewPage());
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
            ElevatedButton(
              onPressed: () {
                if(isLogin == true){
                  Get.to(ReservePage());
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
        ),
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
                      Get.to(LoginPage());
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
