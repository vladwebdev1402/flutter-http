import 'package:flutter/material.dart';
import 'package:laba_http/model/photos.dart';
import 'package:laba_http/ui/photo_viewer.dart';
import 'package:laba_http/widgets/nasa_card/lib/capitalize.dart';

class NasaCard extends StatelessWidget {
  final Photos photo;
  final int index;

  const NasaCard({required this.photo, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$index. ${photo.earthDate}",
          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8.0,
        ),
        PhotoViewer(imgSrc: photo.imgSrc!),
        const SizedBox(
          height: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Rover",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            Text(
              "${photo.rover!.name}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(),
            const Text(
              "Status",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            Text(
              capitalize(photo.rover!.status!),
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Camera",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            Text(
              photo.camera!.fullName!,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(),
          ],
        )
      ],
    );
  }
}
