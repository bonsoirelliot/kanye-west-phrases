import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseModel extends Model {
  String text = 'Нажми кноп очку';
  String phrase = '';
  double arg = 3;
  void changeString() async {
    String _url = 'https://api.kanye.rest/?format=json';
    var response = await http.get(_url);
    try {
      var quote = json.decode(response.body)['quote'] as String;
      if (response.statusCode == 200) {
        text = 'Можно выпить, потому что Канье Уэст сказал:';
        phrase = quote;
      } else {
        text = 'Сегодня просто хороший день, чтобы бухнуц))';
      }
      if (arg == 3) {
        arg = 0;
      } else {
        arg = 3;
      }
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}

BaseModel baseModel = BaseModel();
