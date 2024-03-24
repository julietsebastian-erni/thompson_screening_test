import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thompson_screening_test/widgets/buttom_button_widget.dart';
import 'package:thompson_screening_test/widgets/profile_image_widget.dart';
import 'package:thompson_screening_test/widgets/card_widget.dart';

class BookYourAppointmentPage extends StatefulWidget {
  const BookYourAppointmentPage({super.key});

  @override
  State<BookYourAppointmentPage> createState() =>
      _BookYourAppointmentPageState();
}

class _BookYourAppointmentPageState extends State<BookYourAppointmentPage> {
  List<String> list = ["A", "B", "C"];

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
                "Book your appointment",
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDropdown("Field"),
                    _buildDropdown("Doctor"),
                    _buildAppointmentType(),
                    _buildSelectDate(),
                    _buildSelectTime(),
                  ],
                ),
              ),
            ),
            ButtomButtonWidget(
              title: "Book now",
              onPressed: () {
                Navigator.pushNamed(
                    context, '/book_your_appointment/confirmation');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          CardWidget(
            child: SizedBox(
              height: 20,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  padding: EdgeInsets.zero,
                  child: DropdownButton(
                    isExpanded: true,
                    items: list.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppointmentType() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Appointment Type",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Wrap(
            children: [
              _buildSelection("Chat", false),
              _buildSelection("Video", true),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSelectDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Date",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDate("Fri", "Aug 12", true),
              _buildDate("Sat", "Aug 13"),
              _buildDate("Sun", "Aug 14"),
              _buildDate("Mon", "Aug 15"),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: FaIcon(
                  FontAwesomeIcons.angleRight,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSelectTime() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Time",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Wrap(
            children: [
              _buildSelection("9:00", false),
              _buildSelection("10:00", true),
              _buildSelection("11:00", false),
              _buildSelection("12:00", false),
              _buildSelection("13:00", false),
              _buildSelection("14:00", false),
              _buildSelection("15:00", false),
              _buildSelection("15:30", false),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSelection(String label, [bool isSelected = false]) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CardWidget(
        backgroundColor: isSelected ? Colors.grey.shade300 : null,
        child: SizedBox(
          height: 20,
          width: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: const Color(0xff1A2C48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDate(String day, String date, [bool isToday = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CardWidget(
        backgroundColor: isToday ? Colors.grey.shade300 : null,
        child: SizedBox(
          height: 60,
          width: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff1A2C48),
                ),
              ),
              Text(
                date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  color: const Color(0xff1A2C48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
