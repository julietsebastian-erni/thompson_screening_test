import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoAppointmentPage extends StatefulWidget {
  const VideoAppointmentPage({super.key});

  @override
  State<VideoAppointmentPage> createState() => _VideoAppointmentPageState();
}

class _VideoAppointmentPageState extends State<VideoAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    const doctor = "assets/doctor.jpg";
    const self = "assets/my_profile_picture.jpeg";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(doctor),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Expanded(child: _buildImage(self)),
                _buildNameAndTime(),
                _buildButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String image) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: 175,
        width: 125,
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(image: AssetImage(image)),
          ),
        ),
      ),
    );
  }

  Widget _buildNameAndTime() {
    return const SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Dr. Phil",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Text(
            "00:19:21",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              height: 75,
              width: 75,
              color: Colors.grey.shade400.withOpacity(0.8),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.microphone,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              Navigator.popAndPushNamed(context, '/home_screen');
            },
            child: ClipOval(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red.withOpacity(0.8),
                child: const Center(
                    child: FaIcon(
                  FontAwesomeIcons.phone,
                  color: Colors.white,
                )),
              ),
            ),
          ),
          const SizedBox(width: 24),
          ClipOval(
            child: Container(
              height: 75,
              width: 75,
              color: Colors.grey.shade400.withOpacity(0.8),
              child: const Center(
                  child: FaIcon(
                FontAwesomeIcons.video,
                color: Colors.white,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
