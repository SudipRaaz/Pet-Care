import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/style.dart';

class MyDropdownButton extends StatefulWidget {
  // final String dropdownValue;
  final List<String> options;

  const MyDropdownButton({Key? key, required this.options}) : super(key: key);

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        width: 150,
        height: 2,
        color: AppColors().appBar_theme,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        if (value is String) {
          setState(() {
            dropdownValue = value;
          });
        }
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: MyStyle().heading3,
          ),
        );
      }).toList(),
    );
  }
}
