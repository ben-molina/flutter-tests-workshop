import 'package:flutter/material.dart';
import 'package:workshop/src/cats/cat_dto.dart';

/// Displays detailed information about a SampleItem.
class CatsDetails extends StatelessWidget {
  const CatsDetails({super.key, required this.cat});

  static const routeName = '/details';
  final CatDTO cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage('https://cdn2.thecatapi.com/images/${cat.imageId}.jpg')),
            ListTile(
              title: Text(cat.origin),
              leading: SizedBox(width: 100, child: Text('Origin:')),
            ),
            ListTile(
              title: Text(cat.description),
              leading: SizedBox(width: 100, child: Text('Description:')),
            ),
            ListTile(
              title: Text(cat.temperament),
              leading: SizedBox(width: 100, child: Text('Temperament:')),
            ),
          ],
        ),
      ),
    );
  }
}
