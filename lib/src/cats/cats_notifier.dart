import 'package:flutter/material.dart';

import 'cat_dto.dart';
import 'cats_service.dart';

class CatsNotifier extends ChangeNotifier {
  final CatsService catsService;
  List<CatDTO> _cats = [];

  List<CatDTO> get cats => _cats;

  CatsNotifier({required this.catsService});

  Future<void> load() async {
    _cats = await catsService.fetchCats();
    notifyListeners();
  }
}
