import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thompson_screening_test/widgets/profile_image_widget.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class YourAppointmentsPage extends StatefulWidget {
  const YourAppointmentsPage({super.key});

  @override
  State<YourAppointmentsPage> createState() => _YourAppointmentsPageState();
}

class _YourAppointmentsPageState extends State<YourAppointmentsPage> {
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
                "Your Appointments",
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildAppointments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointments() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _buildAppointmentContent(),
        ],
      ),
    );
  }

  Widget _buildAppointmentItem({
    required Widget leadingIcon,
    required String title,
    required String date,
    required String doctor,
    required Function onPressed,
    bool isChat = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: CardWidget(
          borderRadius: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _buildAppointmentInfo(
                  leadingIcon: leadingIcon,
                  title: title,
                  date: date,
                  doctor: doctor,
                  isChat: isChat,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentType(IconData icon, String type) {
    return Row(
      children: [
        FaIcon(
          icon,
          color: const Color(0xff1A2C48),
          size: 12,
        ),
        const SizedBox(width: 10),
        Text(
          type,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentInfo({
    required Widget leadingIcon,
    required String title,
    required String date,
    required String doctor,
    bool isChat = false,
  }) {
    final icon =
        isChat ? FontAwesomeIcons.solidMessage : FontAwesomeIcons.video;
    final message = isChat ? "Chat appointment" : "Video appointment";

    return ListTile(
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
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctor,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 20),
          _buildAppointmentType(icon, message),
        ],
      ),
      trailing: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          height: 25,
          width: 75,
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
          doctor: "Dr. Phil",
          onPressed: () {
            Navigator.pushNamed(context, '/your_appointments/video');
          },
        ),
        _buildAppointmentItem(
          leadingIcon: const FaIcon(
            FontAwesomeIcons.heartPulse,
            color: Color(0xff1A2C48),
          ),
          title: "Cardiologist check-up",
          date: "Aug 28",
          doctor: "Dr. Marla",
          isChat: true,
          onPressed: () {
            Navigator.pushNamed(context, '/your_appointments/chat');
          },
        ),
      ],
    );
  }
}
