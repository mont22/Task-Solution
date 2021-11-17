/*
*
* Movie End point List for popularity movies
* https://api.themoviedb.org/3/discover/movie?api_key=a06a65f8e9b7f4e31d4cdee71b82fc83&sort_by=popularity.desc&page=1
*
*  */

class ThirdTaskConstants {
  // it used in every endPoint you will call
  static const TheMovieDBAPIKey = "381b8c0be715e4249021621d8c95ed62";
  // the Base URL For TMDB API
  static const BaseURL = "https://api.themoviedb.org/";
  // API versioning number
  static const BaseAPIVersion = "3";
  // the path of movies Endpoint
  static const MovieEndpoint = "/discover/movie";
  // the base URL For images
  static const BaseImagePath = "https://image.tmdb.org/t/p/w500";

  static const MoviesByPopularity =
      "https://api.themoviedb.org/3/discover/movie?api_key=a06a65f8e9b7f4e31d4cdee71b82fc83&sort_by=popularity.desc&page=1";
}

enum MoviesSortBy { popularity, recent }

extension MovieSortByValue on MoviesSortBy {
  String get value {
    switch (this) {
      case MoviesSortBy.popularity:
        return "popularity.desc";
      case MoviesSortBy.recent:
        return "release_date.desc";
      default:
        return "";
    }
  }
}
