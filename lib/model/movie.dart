class Movie {
  String imagePath;
  String movieName;
  String movieType;
  String actor;
  String movieMannager;
  int screenTime;
  DateTime releaseDate;

  Movie(
    {
      required this.imagePath,
      required this.movieName,
      required this.movieType,
      required this.actor,
      required this.screenTime,
      required this.releaseDate,
      required this.movieMannager,
    }
  );
}