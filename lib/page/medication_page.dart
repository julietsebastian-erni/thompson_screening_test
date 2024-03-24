import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thompson_screening_test/widgets/buttom_button_widget.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({super.key});

  @override
  State<MedicationPage> createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  bool isTrue = false;

  @override
  void initState() {
    isTrue = false;
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    _buildIconName(FontAwesomeIcons.pills, "Vitamin C"),
                    _buildMedicineInfo(),
                  ],
                ),
              ),
              ButtomButtonWidget(
                title: "Request refill",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconName(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          FaIcon(
            icon,
            size: 100,
            color: const Color(0xff204ff5),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xff1A2C48),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMedicineInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildReminder(),
        _buildMealInfo(),
        _buildDueDate(),
      ],
    );
  }

  Widget _buildReminder() {
    return _buildListTile(
      leading: const FaIcon(
        FontAwesomeIcons.solidBell,
        size: 18,
      ),
      title: const Text(
        "Everyday at 9:00 AM",
        style: TextStyle(fontSize: 14),
      ),
      trailing: SizedBox(
        height: 30,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Switch(
            value: isTrue,
            onChanged: (bool value) {
              setState(() {
                isTrue = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMealInfo() {
    return _buildListTile(
      leading: ClipOval(
        child: Container(
          height: 18,
          width: 18,
          color: const Color(0xffee574a),
          alignment: Alignment.center,
        ),
      ),
      title: const Text(
        "Before meal",
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildDueDate() {
    return _buildListTile(
      leading: const FaIcon(
        FontAwesomeIcons.solidCalendarXmark,
        size: 18,
      ),
      title: const Text(
        "Finish course",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      trailing: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: 30,
          width: 75,
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: const Text(
            "Aug 23",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff1A2C48),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required Widget leading,
    required Widget title,
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: CardWidget(
              child: ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                leading: leading,
                title: title,
                trailing: trailing,
              ),
            ),
          ),
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
