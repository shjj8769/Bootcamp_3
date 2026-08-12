import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/review.dart';

class Message {
  static List<Movie> movieList = [];
  static List<Review> reviewList = [];
  static int movieIndex = 0;
  static int hideReviewNum = 0;

  // 외부에서 사용이 가능하도록 제작(Message.addData로 사용 가능)
  static void addData() {
    // 이미 데이터가 들어있다면 중복으로 넣지 않고 함수 종료
    if (movieList.isNotEmpty) return;

    // ---------액션------------
    movieList.add(Movie(
      imagePath: 'images/odyssey.png', 
      movieMannager: '',
      movieName: '오디세이', 
      movieType: '액션', 
      actor: '젠데이아', 
      
      screenTime: 173, 
      releaseDate: DateTime(2026, 08, 06),
    ));
    movieList.add(Movie(
      imagePath: 'images/spiderman.png', 
      movieMannager: '',
      movieName: '스파이더 맨 브랜드 뉴 데이', 
      movieType: '액션', 
      actor: '톰 홀랜드', 
      screenTime: 145, 
      releaseDate: DateTime(2026, 07, 29),
    ));
    movieList.add(Movie(
      imagePath: 'images/theoutlaws.png', 
      movieMannager: '',
      movieName: '범죄도시 4', 
      movieType: '액션', 
      actor: '마동석', 
      screenTime: 109, 
      releaseDate: DateTime(2024, 04, 24),
    ));

    // ----------로맨스-------------
    movieList.add(Movie(
      imagePath: 'images/titanic.png', 
      movieMannager: '',
      movieName: '타이타닉', 
      movieType: '로맨스', 
      actor: '레오나르도 디카프리오', 
      screenTime: 195, 
      releaseDate: DateTime(1998, 02, 20),
    ));
    movieList.add(Movie(
      imagePath: 'images/abouttime.png', 
      movieMannager: '',
      movieName: '어바웃 타임', 
      movieType: '로맨스', 
      actor: '도널 글리슨', 
      screenTime: 123, 
      releaseDate: DateTime(2013, 12, 05),
    ));
    movieList.add(Movie(
      imagePath: 'images/oncewewereus.png', 
      movieMannager: '',
      movieName: '만약에 우리', 
      movieType: '로맨스', 
      actor: '구교환, 문가영', 
      screenTime: 115, 
      releaseDate: DateTime(2025, 12, 31),
    ));

    // ---------스릴러-----------
    movieList.add(Movie(
      imagePath: 'images/salmokji.png', 
      movieMannager: '',
      movieName: '살목지', 
      movieType: '스릴러', 
      actor: '김혜윤', 
      screenTime: 95, 
      releaseDate: DateTime(2026, 04, 08),
    ));
    movieList.add(Movie(
      imagePath: 'images/getout.png', 
      movieMannager: '',
      movieName: '겟 아웃', 
      movieType: '스릴러', 
      actor: '대니얼 칼루야', 
      screenTime: 104, 
      releaseDate: DateTime(2017, 05, 17),
    ));
    movieList.add(Movie(
      imagePath: 'images/backroom.png', 
      movieMannager: '',
      movieName: '백룸', 
      movieType: '스릴러', 
      actor: '추이텔 에지오프', 
      screenTime: 110, 
      releaseDate: DateTime(2026, 05, 27),
    ));
  }
}