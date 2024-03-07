import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GalleryScrollScreen extends StatefulWidget {
  const GalleryScrollScreen({
    super.key,
    this.initialIndex = 0,
    required this.title,
    required this.images,
    this.heroTags,
  });

  final int initialIndex;
  final String title;
  final List<ImageProvider> images;
  final Iterable<String>? heroTags;

  @override
  State<GalleryScrollScreen> createState() => _GalleryScrollScreenState();
}

class _GalleryScrollScreenState extends State<GalleryScrollScreen> {
  late int index = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          if (widget.images.length > 1)
            Center(
              widthFactor: 3,
              child: Text(
                '${index + 1}/${widget.images.length}',
                style: const TextStyle(color: Colors.white),
              ),
            )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: PageView.builder(
          controller: PageController(initialPage: widget.initialIndex),
          itemCount: widget.images.length,
          onPageChanged: (i) => setState(() => index = i),
          itemBuilder: (_, i) {
            return InteractiveViewer(
              minScale: 0.2,
              maxScale: 10,
              child: Hero(
                tag: widget.heroTags?.elementAt(i) ?? ValueKey('${widget.title}$i'),
                child: Image(
                  image: widget.images[i],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
