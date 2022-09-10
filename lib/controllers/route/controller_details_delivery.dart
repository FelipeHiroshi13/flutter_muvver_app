import 'package:muvver/models/delivery.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ControllerDetailsDelivery extends ControllerMVC {

  factory ControllerDetailsDelivery() => _this ??= ControllerDetailsDelivery._();

  ControllerDetailsDelivery._();

  static ControllerDetailsDelivery? _this;

  DateTime? start;
  DateTime? end;

  void setDateStart(DateTime start){
    this.start =  start;
  }

  void setDateEnd(DateTime end){
    this.end =  end;
  }

  Delivery setDetailsDelivery(Delivery delivery){
    delivery.initialDate = start.toString();
    delivery.finalDate = end.toString();

    return delivery;
  }

  @override
  void dispose() {
    start = DateTime.now();
    end = DateTime(2023);
  }
}