import 'package:flutter/material.dart';
import 'package:thompson_screening_test/widgets/buttom_button_widget.dart';

class BookConfirmationPage extends StatefulWidget {
  const BookConfirmationPage({super.key});

  @override
  State<BookConfirmationPage> createState() => _BookConfirmationPageState();
}

class _BookConfirmationPageState extends State<BookConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff4f4f4),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(
              children: [
                _buildHomeLogo(),
                _buildMessage(),
              ],
            )),
            ButtomButtonWidget(
              title: "Back home",
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home_screen');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeLogo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Image(image: AssetImage('assets/booking_confirmed.png')),
          )
        ],
      ),
    );
  }

  Widget _buildMessage() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Your booking\nis now confirmed",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xff1A2C48),
        ),
      ),
    );
  }
}
