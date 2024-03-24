import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thompson_screening_test/widgets/buttom_button_widget.dart';
import 'package:thompson_screening_test/widgets/card_icon_widget.dart';
import 'package:thompson_screening_test/widgets/profile_image_widget.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class MyMedicationsPage extends StatefulWidget {
  const MyMedicationsPage({super.key});

  @override
  State<MyMedicationsPage> createState() => _MyMedicationsPageState();
}

class _MyMedicationsPageState extends State<MyMedicationsPage> {
  @override
  Widget build(BuildContext context) {
    const profile = "assets/my_profile_picture.jpeg";
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff4f4f4),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Row(
          children: [
            Expanded(
              child: Text(
                "My Medications",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A2C48),
                ),
              ),
            ),
            ProfileImageWidget(image: profile, height: 40, width: 40),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildMedicationContent(),
              ButtomButtonWidget(
                title: "Ask for prescription",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMedicationContent() {
    return Wrap(
      children: [
        _buildCardItem(
          icon: FontAwesomeIcons.tablets,
          title: "Paracetamol",
        ),
        _buildCardItem(
          icon: FontAwesomeIcons.pills,
          title: "Vitamin C",
          onPressed: () {
            Navigator.pushNamed(context, '/my_medications/medication');
          },
        ),
        _buildCardItem(
          icon: FontAwesomeIcons.prescriptionBottleMedical,
          title: "Vitamin D",
        ),
        _buildAddCard(),
      ],
    );
  }

  Widget _buildCardItem({
    required IconData icon,
    required String title,
    Function? onPressed,
  }) {
    return CardIconWidget(
      icon: icon,
      title: title,
      onPressed: onPressed,
    );
  }

  Widget _buildAddCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CardWidget(
        borderRadius: 15,
        borderColor: Colors.grey.shade300,
        backgroundColor: const Color(0xfff4f4f4),
        child: SizedBox(
          height: 125,
          width: 85,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.grey.shade300,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
