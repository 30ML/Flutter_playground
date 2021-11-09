import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpHelper {
  final String urlKey = 'api_key=${dotenv.env['MOVIE_API_KEY']}';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=ko-KR';

  Future<String?> getUpcoming() async {
    final Uri upcoming = (urlBase + urlUpcoming + urlKey + urlLanguage) as Uri;
    http.Response result = await http.get(upcoming);
    return (result.statusCode == HttpStatus.ok) ? result.body : null;
  }
}
