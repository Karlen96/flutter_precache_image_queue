import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (_, i) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Image.network(
              images[i],
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
