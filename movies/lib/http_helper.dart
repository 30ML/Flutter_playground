import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpHelper {
  final String urlKey = 'api_key=${dotenv.env['MOVIE_API_KEY']}';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=ko-KR';

  Future<String> getUpcoming() async {
    final Uri upcoming = (urlBase + urlUpcoming + urlKey + urlLanguage) as Uri;
    print('uri: $Uri');
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      print('OK');
      return result.body;
    } else {
      print('NOT FOUND');
      return 'no data';
    }
  }
}
