import 'package:flutter/material.dart';

import '../providers/queue_provider.dart';
import 'images_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _queueController = QueueProvider();
  final imagesList = <String>[
    for (var i = 0; i < 10; i++) 'https://picsum.photos/2000/1000?random=$i',
  ];

  void _loadImages() {
    for (var i = 0; i < imagesList.length; i++) {
      _queueController.add(
        callback: () => precacheImage(
          NetworkImage(imagesList[i]),
          context,
        ),
      );
    }
  }

  void _onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ImagesPage(
          images: imagesList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Precaching'),
      ),
      body: Center(
        child: TextButton(
          onPressed: _onPressed,
          child: const Text('Open page'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadImages,
        child: const Icon(Icons.cloud_download),
      ),
    );
  }
}
