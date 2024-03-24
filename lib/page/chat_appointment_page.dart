import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thompson_screening_test/widgets/profile_image_widget.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class ChatAppointmentPage extends StatefulWidget {
  const ChatAppointmentPage({super.key});

  @override
  State<ChatAppointmentPage> createState() => _ChatAppointmentPageState();
}

class _ChatAppointmentPageState extends State<ChatAppointmentPage> {
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
        title: Row(
          children: [
            Expanded(
              child: _buildChatName(),
            ),
            _buildButtons(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: _buildChatContent()),
            _buildTextInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A2C48),
                ),
              ),
              Text(
                "11:00",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff1A2C48),
                ),
              ),
            ],
          ),
          _buildReceiverChat(),
          _buildSenderChat(),
        ],
      ),
    );
  }

  Widget _buildTextInput() {
    return const Padding(
      padding: EdgeInsets.all(14),
      child: SizedBox(
        child: CardWidget(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type something...",
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
              FaIcon(FontAwesomeIcons.solidPaperPlane),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReceiverChat() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CardWidget(
            backgroundColor: Color(0xffdee8ff),
            child: Row(
              children: [
                Text(
                  "How's the diet?",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 20),
                Text(
                  "11:00",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSenderChat() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CardWidget(
            backgroundColor: Color(0xffd9dbe0),
            child: Row(
              children: [
                Text(
                  "I fell better now.",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 20),
                Text(
                  "11:01",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        children: [
          FaIcon(FontAwesomeIcons.phone, size: 20),
          SizedBox(width: 30),
          FaIcon(FontAwesomeIcons.video, size: 20),
        ],
      ),
    );
  }

  Widget _buildChatName() {
    const doctor = "assets/doctor2.jpeg";
    return Row(
      children: [
        const ProfileImageWidget(image: doctor, height: 40, width: 40),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Dr. Marla",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A2C48),
              ),
            ),
            Text(
              "Online now",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
