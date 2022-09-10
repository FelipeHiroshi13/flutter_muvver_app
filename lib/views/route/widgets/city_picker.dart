import 'package:flutter/material.dart';

class CityPicker extends StatefulWidget {
  const CityPicker({Key? key, required this.title}) : super(key: key);
  @required
  final String title;

  @override
  State<CityPicker> createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[Container(
          height: 60,
          width: 340,
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: widget.title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          )
      )],
    );
  }
}
