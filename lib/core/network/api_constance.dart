class ApiConstance{
  static String nowPlayingMovies="/movie/now_playing?api_key=";
  static String popularMovies="/movie/popular?api_key=";
  static String topRatedMovies="/movie/top_rated?api_key=";
  static String apiKey="c3435cfe40aeb079689227d82bf921d3";

  static const String baseImageUrl="https//image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=>"$baseImageUrl$path";
}