import 'package:flutter/material.dart';
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


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bootcamp Movie'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 
            },
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
          ]
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
                size: 50
              ),
              currentAccountPictureSize: Size(10, 100),
              accountName: Text("UserName"), 
              accountEmail: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("user@email.com"),
                  ElevatedButton(
                    onPressed: () {
                      //
                    }, 
                    child: Text('로그인')
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                //
              }, 
              child: Text('마이페이지')
            ),
            ElevatedButton(
              onPressed: () {
                //
              }, 
              child: Text('영화 리뷰')
            ),
            ElevatedButton(
              onPressed: () {
                //
              }, 
              child: Text('예매하기')
            ),
          ],
        ),
      ),
    );
  }
}
