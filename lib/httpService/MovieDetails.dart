import 'dart:convert';

import '../Const/api.dart';
import '../Model/MovieDetails.dart';
import 'package:http/http.dart' as http;
class HttpMovieDetails {
  Future<MovieDetailsModel?> getMovieDetail(String id) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
    http.Request('POST', Uri.parse('$baseurl/api/v1/movies_details'));
    request.body =
        json.encode({"movie_id": id, "user_id": "8"});
    request.headers.addAll(headers);


    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    try{
      if (response.statusCode == 200) {
        print(responsedata.body);
        return movieDetailsModelFromJson(responsedata.body);
      } else {
        print(responsedata.body);
      }
    }
    catch(e, s){
      print(e);
      print(s);
    }
    return null;

  }
}