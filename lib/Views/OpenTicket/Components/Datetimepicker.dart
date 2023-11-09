import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datetimepicker extends StatefulWidget {
  final TextEditingController controller; // Add a TextEditingController

  Datetimepicker({
    Key? key,
    required this.controller, // Initialize the TextEditingController
  }) : super(key: key);

  @override
  State<Datetimepicker> createState() => _DatetimepickerState();
}

class _DatetimepickerState extends State<Datetimepicker> {
  String Date = 'Sélectionnée une date';
  String formatDate(String dateString) {
    final date = DateTime.parse(dateString).toLocal();

    final monthNames = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];

    final month = monthNames[date.month - 1];
    final day = date.day;
    final year = date.year;
    final hours = DateFormat('HH').format(date);
    final minutes = DateFormat('mm').format(date);

    final formattedDate =
        '$month $day, $year at ${hours.padLeft(2, '0')}:${minutes.padLeft(2, '0')}';

    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateDateText);
  }

  void _updateDateText() {
    setState(() {
      Date = formatDate(widget.controller.text);
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 17),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
          child: Text(
            'Date de depot :',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffA9A9A9), width: 1.5),
            ),
            child: Row(
              children: [
                Text(
                  '${Date} ',
                  style: TextStyle(
                    fontSize: 16,
                  ),

                ),
                Spacer(),
                Icon(Icons.date_range, color: Colors.black),
              ],
            ),
          ),
          onTap: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );

            if (selectedDate != null) {
              TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (selectedTime != null) {
                selectedDate = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                );

                widget.controller.text = selectedDate.toLocal().toIso8601String();
              }
            }
          },
        ),
      ],
    );
  }
}
