class MovieModel {
  MovieModel({
    required this.averageRating,
    required this.backdropPath,
    required this.description,
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

  late final double? averageRating;
  late final String? backdropPath;
  late final String? description;
  late final int? id;
  late final String? iso_3166_1;
  late final String? iso_639_1;
  late final String? name;
  late final int? page;
  late final String? posterPath;
  late final bool public;
  late final List<Movie> listMovies;
  late final int? revenue;
  late final int? runtime;
  late final String? sortBy;
  late final int? totalPages;
  late final int? totalResults;

  MovieModel.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    backdropPath = json['backdrop_path'];
    description = json['description'];
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

  MovieModel copyWith({
   double? averageRating,
   String? backdropPath,
   String? description,
   int? id,
   String? iso_3166_1,
   String? iso_639_1,
   String? name,
   int? page,
   String? posterPath,
   bool? public,
   List<Movie>? listMovies,
   int? revenue,
   int? runtime,
   String? sortBy,
   int? totalPages,
   int? totalResults,
  }) {
    return MovieModel(
      averageRating: averageRating ?? this.averageRating,
      backdropPath: backdropPath ?? this.backdropPath,
      description: description ?? this.description,
      id: id ?? this.id,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
      page: page ?? this.page,
      posterPath: posterPath ?? this.posterPath,
      public: public ?? this.public,
      listMovies: listMovies ?? this.listMovies,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      sortBy: sortBy ?? this.sortBy,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }


  @override
  String toString() {
    return 'MovieModel(averageRating: $averageRating, backdropPath: $backdropPath, description: $description, id: $id, iso_3166_1: $iso_3166_1, iso_639_1: $iso_639_1, name: $name, page: $page, posterPath: $posterPath, public: $public, listMovies: $listMovies, revenue: $revenue, runtime: $runtime, sortBy: $sortBy, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.averageRating == averageRating &&
      other.backdropPath == backdropPath &&
      other.description == description &&
      other.id == id &&
      other.iso_3166_1 == iso_3166_1 &&
      other.iso_639_1 == iso_639_1 &&
      other.name == name &&
      other.page == page &&
      other.posterPath == posterPath &&
      other.public == public &&
      other.listMovies == listMovies &&
      other.revenue == revenue &&
      other.runtime == runtime &&
      other.sortBy == sortBy &&
      other.totalPages == totalPages &&
      other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return averageRating.hashCode ^
      backdropPath.hashCode ^
      description.hashCode ^
      id.hashCode ^
      iso_3166_1.hashCode ^
      iso_639_1.hashCode ^
      name.hashCode ^
      page.hashCode ^
      posterPath.hashCode ^
      public.hashCode ^
      listMovies.hashCode ^
      revenue.hashCode ^
      runtime.hashCode ^
      sortBy.hashCode ^
      totalPages.hashCode ^
      totalResults.hashCode;
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

  late final bool? adult;
  late final String? backdrop_path;
  late final List<int> genre_ids;
  late final int? id;
  late final String? media_type;
  late final String? original_language;
  late final String? original_title;
  late final String? overview;
  late final double? popularity;
  late final String? poster_path;
  late final String? release_date;
  late final String? title;
  late final bool? video;
  late final double? vote_average;
  late final int? vote_count;

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

  Movie copyWith({
    bool? adult,
    String? backdrop_path,
    List<int>? genre_ids,
    int? id,
    String? media_type,
    String? original_language,
    String? original_title,
    String? overview,
    double? popularity,
    String? poster_path,
    String? release_date,
    String? title,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      genre_ids: genre_ids ?? this.genre_ids,
      id: id ?? this.id,
      media_type: media_type ?? this.media_type,
      original_language: original_language ?? this.original_language,
      original_title: original_title ?? this.original_title,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      poster_path: poster_path ?? this.poster_path,
      release_date: release_date ?? this.release_date,
      title: title ?? this.title,
      video: video ?? this.video,
      vote_average: vote_average ?? this.vote_average,
      vote_count: vote_count ?? this.vote_count,
    );
  }

  @override
  String toString() {
    return 'Movie(adult: $adult, backdrop_path: $backdrop_path, genre_ids: $genre_ids, id: $id, media_type: $media_type, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, release_date: $release_date, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.adult == adult &&
      other.backdrop_path == backdrop_path &&
      other.genre_ids == genre_ids &&
      other.id == id &&
      other.media_type == media_type &&
      other.original_language == original_language &&
      other.original_title == original_title &&
      other.overview == overview &&
      other.popularity == popularity &&
      other.poster_path == poster_path &&
      other.release_date == release_date &&
      other.title == title &&
      other.video == video &&
      other.vote_average == vote_average &&
      other.vote_count == vote_count;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
      backdrop_path.hashCode ^
      genre_ids.hashCode ^
      id.hashCode ^
      media_type.hashCode ^
      original_language.hashCode ^
      original_title.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      poster_path.hashCode ^
      release_date.hashCode ^
      title.hashCode ^
      video.hashCode ^
      vote_average.hashCode ^
      vote_count.hashCode;
  }
}
