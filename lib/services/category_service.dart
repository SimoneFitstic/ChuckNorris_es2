import "dart:convert";
import "package:http/http.dart" as http;

final url = Uri.parse("https://api.chucknorris.io/jokes/categories");

Future<List> getCategories() async {
  final res = await http.get(url);
  final data = json.decode(res.body);
  return data as List<dynamic>;
}
