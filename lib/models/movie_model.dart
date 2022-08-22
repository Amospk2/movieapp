class MovieModel {
  MovieModel({
    required this.averageRating,
    required this.backdropPath,
    required this.description,
    required this.createdBy,
    required this.id,
    required this.iso_3166_1,
    required this.iso_639_1,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.listMovies,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });

  late final double averageRating;
  late final String backdropPath;
  late final CreatedBy createdBy;
  late final String description;
  late final int id;
  late final String iso_3166_1;
  late final String iso_639_1;
  late final String name;
  late final int page;
  late final String posterPath;
  late final bool public;
  late final List<Movie> listMovies;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  MovieModel.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    backdropPath = json['backdrop_path'];
    description = json['description'];
    createdBy = CreatedBy.fromJson(json['created_by']);
    id = json['id'];
    iso_3166_1 = json['iso_3166_1'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
    page = json['page'];
    posterPath = json['poster_path'];
    public = json['public'];
    listMovies =
        List.from(json['results']).map((e) => Movie.fromJson(e)).toList();
    revenue = json['revenue'];
    runtime = json['runtime'];
    sortBy = json['sort_by'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['averageRating'] = averageRating;
    _data['backdropPath'] = backdropPath;
    _data['description'] = description;
    _data['create_by'] = createdBy.toJson();
    _data['id'] = id;
    _data['iso_3166_1'] = iso_3166_1;
    _data['iso_639_1'] = iso_639_1;
    _data['name'] = name;
    _data['page'] = page;
    _data['posterPath'] = posterPath;
    _data['public'] = public;
    _data['results'] = listMovies;
    _data['revenue'] = revenue;
    _data['runtime'] = runtime;
    _data['sortBy'] = sortBy;
    _data['totalPages'] = totalPages;
    _data['totalResults'] = totalResults;

    return _data;
  }
}

class Movie {
  Movie({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.media_type,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  late final bool adult;
  late final String backdrop_path;
  late final List<int> genre_ids;
  late final int id;
  late final String media_type;
  late final String original_language;
  late final String original_title;
  late final String overview;
  late final double popularity;
  late final String poster_path;
  late final String release_date;
  late final String title;
  late final bool video;
  late final double vote_average;
  late final int vote_count;

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdrop_path = json['backdrop_path'];
    genre_ids = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    media_type = json['media_type'];
    original_language = json['original_language'];
    original_title = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'].toDouble();
    poster_path = json['poster_path'];
    release_date = json['release_date'];
    title = json['title'];
    video = json['video'];
    vote_average = json['vote_average'].toDouble();
    vote_count = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['adult'] = adult;
    _data['backdrop_path'] = backdrop_path;
    _data['genre_ids'] = genre_ids;
    _data['id'] = id;
    _data['media_type'] = media_type;
    _data['original_language'] = original_language;
    _data['original_title'] = original_title;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = poster_path;
    _data['release_date'] = release_date;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = vote_average;
    _data['vote_count'] = vote_count;

    return _data;
  }
}

class CreatedBy {
  CreatedBy({
    required this.gravatar_hash,
    required this.id,
    required this.name,
    required this.username,
  });

  late final String gravatar_hash;
  late final String id;
  late final String name;
  late final String username;

  CreatedBy.fromJson(Map<String, dynamic> json) {
    gravatar_hash = json['gravatar_hash'];
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gravatar_hash'] = gravatar_hash;
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;

    return _data;
  }
}
