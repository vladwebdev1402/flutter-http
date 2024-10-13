import 'package:flutter/material.dart';

class PhotoViewer extends StatefulWidget {
  final String imgSrc;

  const PhotoViewer({super.key, required this.imgSrc});

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  bool _isImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isImageLoaded) {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, _, __) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  leading: BackButton(
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: InteractiveViewer(
                    maxScale: 10.0,
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      widget.imgSrc,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
      child: Image.network(
        widget.imgSrc,
        height: 256.0,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            _isImageLoaded = true;
            return child;
          }
          return Container(
            height: 256.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
          );
        },
        errorBuilder: (context, error, stackTrace) {
          _isImageLoaded = false;
          return Container(
            height: 256.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: const Center(
              child: Text("Photo Not Found"),
            ),
          );
        },
      ),
    );
  }
}
