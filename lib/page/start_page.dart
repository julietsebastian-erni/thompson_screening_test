import 'package:flutter/material.dart';
import 'package:thompson_screening_test/widgets/buttom_button_widget.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildHomeLogo(),
          ButtomButtonWidget(
            title: "Start",
            onPressed: () {
              Navigator.pushNamed(context, '/home_screen');
            },
          ),
        ],
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
            padding: EdgeInsets.only(top: 150),
            child: Image(image: AssetImage('assets/logo_icon.png')),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
            child: Image(image: AssetImage('assets/brand_name.png')),
          ),
        ],
      ),
    );
  }
}
