import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../controllers/route/controller_details_delivery.dart';

class DataPicker extends StatefulWidget {
  final String text;

  final ControllerDetailsDelivery controlsDetailsDelivery;

  const DataPicker(
      {Key? key, required this.text, required this.controlsDetailsDelivery})
      : super(key: key);

  @override
  State<DataPicker> createState() => _DataPickerState();
}

class _DataPickerState extends State<DataPicker> {
  String _selectedDate = "";
  late ControllerDetailsDelivery _controllerDetailsDelivery;

  DateTime? initialDate;
  DateTime? lastDate;

  @override
  void initState() {
    _selectedDate = widget.text;
    _controllerDetailsDelivery = widget.controlsDetailsDelivery;
    setDateText();
  }

  void setDateText() {
    if (_selectedDate == 'Data de partida' &&
        _controllerDetailsDelivery.start != null) {
      setState(() {
        _selectedDate =
            DateFormat('dd-MM-yyyy').format(_controllerDetailsDelivery.start!);
      });
    }

    if (_selectedDate == 'Data de chegada' &&
        _controllerDetailsDelivery.end != null) {
      setState(() {
        _selectedDate =
            DateFormat('dd-MM-yyyy').format(_controllerDetailsDelivery.end!);
      });
    }

  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      locale: const Locale("pt", "BR"),
      initialDate: _controllerDetailsDelivery.start == null
          ? DateTime.now()
          : _controllerDetailsDelivery.start!,
      firstDate: _controllerDetailsDelivery.start == null
          ? DateTime.now()
          : _controllerDetailsDelivery.start!,
      lastDate: _controllerDetailsDelivery.end == null
          ? DateTime(2023)
          : _controllerDetailsDelivery.end!,
    );
    if (d != null) {
      if (_selectedDate == 'Data de partida') {
        widget.controlsDetailsDelivery.setDateStart(d);
      } else {
        widget.controlsDetailsDelivery.setDateEnd(d);
      }
      setState(() {
        _selectedDate = DateFormat('dd-MM-yyyy').format(d);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        width: 160,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: InkWell(
          child: Center(
            child: Text(
              _selectedDate,
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            _selectDate(context);
          },
        ));
  }
}
