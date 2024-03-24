import 'package:flutter/material.dart';

class ButtomButtonWidget extends StatefulWidget {
  const ButtomButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  State<ButtomButtonWidget> createState() => _ButtomButtonWidgetState();
}

class _ButtomButtonWidgetState extends State<ButtomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1A2C48),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                widget.onPressed();
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
