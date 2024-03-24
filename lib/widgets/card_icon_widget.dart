import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class CardIconWidget extends StatefulWidget {
  const CardIconWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  final IconData icon;
  final String title;
  final Function? onPressed;

  @override
  State<CardIconWidget> createState() => _CardIconWidgetState();
}

class _CardIconWidgetState extends State<CardIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: widget.onPressed == null ? null : () => widget.onPressed!(),
        child: CardWidget(
          borderRadius: 15,
          child: SizedBox(
            height: 125,
            width: 85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  widget.icon,
                  color: const Color(0xff204ff5),
                  size: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
