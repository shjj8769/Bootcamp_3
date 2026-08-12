import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Property
  late TextEditingController userIdController;   // ID 컨트롤러
  late TextEditingController passwordController; // password 컨트롤러
  final box = GetStorage();                      // 실행

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    // initStorage();
  }

  @override
  void dispose() {
    // disposeStorage();
    super.dispose();
  }

  //   void disposeStorage(){
  //   box.erase();
  // }

    void initStorage(){ // 항목
    box.write('isLogin', false);
    box.write('p_userId', "");
    box.write('p_password', "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'CINE Log',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '영화를 고르고, 예매하고, 기록하는 하나의 앱',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userIdController,
                decoration: InputDecoration(
                  labelText: '아이디',
                  icon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,    // 비밀번호 가리기
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  icon: Icon(Icons.lock_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if(userIdController.text.trim().isEmpty || passwordController.text.trim().isEmpty){
                  errorSnackBar();
                }else{
                  if(userIdController.text.trim() == 'admin' && passwordController.text.trim() == '1234'){
                  _showDialog();
                  }else{
                    checkSnackBar();
                  }
                }
              }, 
              child: Text('로그인'),
            ),
          ],
        ),
      ),
    );
  } // build

  // -------- Functions -------

    void _showDialog(){
    Get.defaultDialog(
      title: '환영합니다.',
      middleText: '확인 되었습니다',
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: (){
            saveStorage();
            Get.back();
            Get.back(result: true);
          }, 
          child: Text('확인'),
        ),
      ]
    );
  }

    void checkSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("사용자 ID나 암호가 일치 하지 않습니다."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
        ),
    );
  }

  void errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("사용자 ID와 암호를 입력 하세요"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        ),
    );
  }

  void saveStorage(){
    box.write('isLogin', true);     // 로그인 성공 저장
    box.write('p_userId', userIdController.text.trim());
    box.write('p_password', passwordController.text.trim());
  }

} // class 