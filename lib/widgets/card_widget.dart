import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
  });

  final Widget child;
  final num? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor ?? Colors.white,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius?.toDouble() ?? 10)),
        color: widget.backgroundColor ?? Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: widget.child,
      ),
    );
  }
}
