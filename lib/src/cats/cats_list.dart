import 'package:flutter/material.dart';
import 'package:workshop/src/cats/cats_details.dart';
import 'package:workshop/src/cats/cats_notifier.dart';

import '../settings/settings_view.dart';

/// Displays a list of SampleItems.
class CatsList extends StatelessWidget {
  const CatsList({
    super.key,
    required this.catsNotifier,
  });

  static const routeName = '/';

  final CatsNotifier catsNotifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListenableBuilder(
          listenable: catsNotifier,
          builder: (BuildContext context, Widget? child) {
            return ListView.builder(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'sampleItemListView',
              itemCount: catsNotifier.cats.length,
              itemBuilder: (BuildContext context, int index) {
                final cat = catsNotifier.cats[index];

                return ListTile(
                    title: Text(cat.name),
                    leading: const CircleAvatar(
                      // Display the Flutter Logo image asset.
                      foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CatsDetails.routeName,
                        arguments: cat,
                      );
                    });
              },
            );
          }),
    );
  }
}
