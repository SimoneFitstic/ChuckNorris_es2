import 'dart:io';

import 'package:chucknorris/chucknorris.dart' as chucknorris;
import 'package:chucknorris/services/category_service.dart';

void main(List<String> arguments) async {
  //version random
  //final quote = await chucknorris.cit();
  //print(quote);

  //version category
  final cats = await getCategories();

  print("Choose the category");

  for (var i = 0; i < cats.length; i++) {
    print("$i - ${cats[i]}");
  }

  final catIndex = stdin.readLineSync();
  final cat = cats[int.parse(catIndex!)];

  final quote = await chucknorris.getQuoteFromCategoryAsync(cat);
  print(quote);

  return;
}
