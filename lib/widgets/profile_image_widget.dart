import 'package:flutter/material.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  final String image;
  final num height;
  final num width;

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: AssetImage(widget.image),
        height: widget.height.toDouble(),
        width: widget.width.toDouble(),
        fit: BoxFit.fill,
      ),
    );
  }
}
