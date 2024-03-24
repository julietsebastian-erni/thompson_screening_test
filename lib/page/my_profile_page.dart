import 'package:flutter/material.dart';
import 'package:thompson_screening_test/widgets/buttom_button_widget.dart';
import 'package:thompson_screening_test/widgets/profile_image_widget.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    const image = "assets/my_profile_picture.jpeg";

    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff4f4f4),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ProfileImageWidget(image: image, height: 100, width: 100),
            _buildName(),
            _buildAgeGender(),
            _buildMedicalInformation(),
            _buildEmergencyContact(),
            ButtomButtonWidget(
              title: "Edit Details",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Jacob Jacobs",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xff1A2C48),
        ),
      ),
    );
  }

  Widget _buildAgeGender() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardWidget(
            borderRadius: 20,
            child: Text(
              "47 years old",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A2C48),
              ),
            ),
          ),
          SizedBox(width: 30),
          CardWidget(
            borderRadius: 20,
            child: Text(
              "Male",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A2C48),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    TextEditingController controller;
    controller = TextEditingController(text: value);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(labelText: label),
        controller: controller,
      ),
    );
  }

  Widget _buildMedicalInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          _buildTextField("Blood Type", "O+"),
          _buildTextField("Weight", "78kg"),
          _buildTextField("Height", "182cm"),
          _buildTextField("Allergies", "Shellfish Fruit"),
        ],
      ),
    );
  }

  Widget _buildEmergencyContact() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 32),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Emergency Contact",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A2C48),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CardWidget(
                    borderRadius: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Container(
                            height: 25,
                            width: 25,
                            color: const Color(0xffd9dbe0),
                            alignment: Alignment.center,
                            child: const Text(
                              "1",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Mother",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1A2C48),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CardWidget(
                    borderRadius: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Container(
                            height: 25,
                            width: 25,
                            color: const Color(0xffd9dbe0),
                            alignment: Alignment.center,
                            child: const Text(
                              "2",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Friend",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1A2C48),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
