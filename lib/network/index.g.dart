// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://api.themoviedb.org/3';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<NetResult<BaseList<Movie>>> _getPopularMovies(int page) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NetResult<BaseList<Movie>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/movie/popular',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NetResult<BaseList<Movie>> _value;
    try {
      _value = NetResult<BaseList<Movie>>.fromJson(
        _result.data!,
        (json) => BaseList<Movie>.fromJson(
          json as Map<String, dynamic>,
          (json) => Movie.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NetResult<BaseList<Movie>>> getPopularMovies(int page) {
    return MoonCallAdapter<BaseList<Movie>>().adapt(
      () => _getPopularMovies(page),
    );
  }

  Future<NetResult<BaseList<Movie>>> _getTopRatedMovies(int page) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NetResult<BaseList<Movie>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/movie/top_rated',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NetResult<BaseList<Movie>> _value;
    try {
      _value = NetResult<BaseList<Movie>>.fromJson(
        _result.data!,
        (json) => BaseList<Movie>.fromJson(
          json as Map<String, dynamic>,
          (json) => Movie.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NetResult<BaseList<Movie>>> getTopRatedMovies(int page) {
    return MoonCallAdapter<BaseList<Movie>>().adapt(
      () => _getTopRatedMovies(page),
    );
  }

  Future<NetResult<BaseList<Movie>>> _getTrendingMovies(int page) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NetResult<BaseList<Movie>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/trending/movie/day',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NetResult<BaseList<Movie>> _value;
    try {
      _value = NetResult<BaseList<Movie>>.fromJson(
        _result.data!,
        (json) => BaseList<Movie>.fromJson(
          json as Map<String, dynamic>,
          (json) => Movie.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NetResult<BaseList<Movie>>> getTrendingMovies(int page) {
    return MoonCallAdapter<BaseList<Movie>>().adapt(
      () => _getTrendingMovies(page),
    );
  }

  Future<NetResult<CastersOfMovie>> _getMovieCasters(String movieId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NetResult<CastersOfMovie>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/movie/${movieId}/credits',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NetResult<CastersOfMovie> _value;
    try {
      _value = NetResult<CastersOfMovie>.fromJson(
        _result.data!,
        (json) => CastersOfMovie.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NetResult<CastersOfMovie>> getMovieCasters(String movieId) {
    return MoonCallAdapter<CastersOfMovie>().adapt(
      () => _getMovieCasters(movieId),
    );
  }

  Future<NetResult<Caster>> _getCasterInfo(String personId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NetResult<Caster>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/person/${personId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NetResult<Caster> _value;
    try {
      _value = NetResult<Caster>.fromJson(
        _result.data!,
        (json) => Caster.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NetResult<Caster>> getCasterInfo(String personId) {
    return MoonCallAdapter<Caster>().adapt(() => _getCasterInfo(personId));
  }

  Future<NetResult<MoviesOfCaster>> _getMoviesOfCaster(String personId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NetResult<MoviesOfCaster>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/person/${personId}/movie_credits',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NetResult<MoviesOfCaster> _value;
    try {
      _value = NetResult<MoviesOfCaster>.fromJson(
        _result.data!,
        (json) => MoviesOfCaster.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NetResult<MoviesOfCaster>> getMoviesOfCaster(String personId) {
    return MoonCallAdapter<MoviesOfCaster>().adapt(
      () => _getMoviesOfCaster(personId),
    );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
