import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thompson_screening_test/widgets/card_icon_widget.dart';
import 'package:thompson_screening_test/widgets/profile_image_widget.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    const profile = "assets/my_profile_picture.jpeg";
    const brand = "assets/brand_name.png";

    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff4f4f4),
        leading: const Icon(Icons.menu_rounded),
        title: Row(
          children: [
            const Expanded(
              child: SizedBox(
                height: 20,
                child: Image(image: AssetImage(brand)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/my_profile');
              },
              child: const ProfileImageWidget(
                  image: profile, height: 50, width: 50),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildSearchBar(),
              _buildUpcomingAppointments(),
              _buildCurrentMedications(),
              _buildFindYourDoctor(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return const SizedBox(
      child: CardWidget(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your text here",
                  hintMaxLines: 1,
                  hintTextDirection: TextDirection.ltr,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            Icon(Icons.search_rounded),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointments() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _buildSubHeader("Upcoming Appointments", () {
            Navigator.pushNamed(context, '/your_appointments');
          }),
          _buildAppointmentContent(),
        ],
      ),
    );
  }

  Widget _buildCurrentMedications() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _buildSubHeader("Current Medications", () {
            Navigator.pushNamed(context, '/my_medications');
          }),
          _buildMedicationContent(),
        ],
      ),
    );
  }

  Widget _buildFindYourDoctor() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _buildSubHeader("Find your doctor", () {}),
          _buildDoctorsContent(),
        ],
      ),
    );
  }

  Widget _buildDoctorsContent() {
    return Wrap(
      children: [
        _buildCardItem(
          icon: FontAwesomeIcons.stethoscope,
          title: "General",
        ),
        _buildCardItem(
            icon: FontAwesomeIcons.tooth,
            title: "Dentist",
            onPressed: () {
              Navigator.pushNamed(context, '/book_your_appointment');
            }),
        _buildCardItem(
          icon: FontAwesomeIcons.dna,
          title: "Geneticist",
        ),
        _buildCardItem(
          icon: FontAwesomeIcons.syringe,
          title: "Nurse",
        ),
        _buildCardItem(
          icon: FontAwesomeIcons.virus,
          title: "Virologist",
        ),
        _buildCardItem(
          icon: FontAwesomeIcons.heartPulse,
          title: "Cardiologist",
        ),
      ],
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
        ),
        _buildCardItem(
          icon: FontAwesomeIcons.prescriptionBottleMedical,
          title: "Vitamin D",
        ),
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

  Widget _buildAppointmentItem({
    required Widget leadingIcon,
    required String title,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CardWidget(
        borderRadius: 15,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: leadingIcon,
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A2C48),
              ),
            ),
            trailing: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                height: 25,
                width: 80,
                color: const Color(0xffb2c9fb),
                alignment: Alignment.center,
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1A2C48),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentContent() {
    return Column(
      children: [
        _buildAppointmentItem(
          leadingIcon: const FaIcon(
            FontAwesomeIcons.stethoscope,
            color: Color(0xff1A2C48),
          ),
          title: "General check-up",
          date: "Aug 12",
        ),
        _buildAppointmentItem(
          leadingIcon: const FaIcon(
            FontAwesomeIcons.heartPulse,
            color: Color(0xff1A2C48),
          ),
          title: "Cardiologist check-up",
          date: "Aug 28",
        ),
      ],
    );
  }

  Widget _buildSubHeader(String title, Function onPressed) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A2C48),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onPressed(),
          child: Text(
            "View all",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }
}
