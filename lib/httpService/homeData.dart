import '../Const/api.dart';
import '../Model/HomePageModel.dart';
import 'package:http/http.dart' as http;
class HttpHomepage {
  Future<HomePageModel?> getHomePageMovie() async {
    try {
      var request = http.Request('POST', Uri.parse('$baseurl/api/v1/home'));

      http.StreamedResponse response = await request.send();
      var responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        return homePageModelFromJson(responseData.body);
      } else {
        print(responseData.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}