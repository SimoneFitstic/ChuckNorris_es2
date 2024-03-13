import "dart:convert";
import "package:http/http.dart" as http;

final url = Uri.parse("https://api.chucknorris.io/jokes/random");
final urlWithCat =
    Uri.parse("https://api.chucknorris.io/jokes/random?category={category}");
final urlWithSrc =
    Uri.parse("https://api.chucknorris.iojokes/search?query={query}");

Future<ChuckNorrisFact> cit() async {
  final res = await http.get(url);
  return ChuckNorrisFact.fromJson(res.body);
}

Future<ChuckNorrisFact> getQuoteFromCategoryAsync(String category) async {
  final urlCat = urlWithCat.replace(queryParameters: {"category": category});

  final res = await http.get(urlCat);
  return ChuckNorrisFact.fromJson(res.body);
}

Future<List> getQuotebySearchParam(String searchParam) async {
  final urlSrc = urlWithSrc.replace(queryParameters: {"query": searchParam});

  final res = await http.get(urlSrc);
  final data = json.decode(res.body);
  final list = data['result'] as List;
  final cfs =
      list.map((e) => ChuckNorrisFact.fromMap(e as Map<String, dynamic>))
      .toList();
 
  return cfs as List<dynamic>;
}

class ChuckNorrisFact {
  String id;
  String fact;
  String createdAt;

  ChuckNorrisFact(
      {required this.id, required this.fact, required this.createdAt});

  factory ChuckNorrisFact.fromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return ChuckNorrisFact.fromMap(data);
  }

  factory ChuckNorrisFact.fromMap(Map<String, dynamic> map) {
    final fact = ChuckNorrisFact(
        id: map["id"], fact: map["value"], createdAt: map["created_at"]);
    return fact;
  }

  @override
  String toString() {
    return """
    ID: $id,
    Created At: $createdAt

    Fact: $fact,
    
    """;
  }
}
