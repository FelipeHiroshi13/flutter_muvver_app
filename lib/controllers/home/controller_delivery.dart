import 'package:muvver/models/delivery.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ControllerDelivery extends ControllerMVC {

  factory ControllerDelivery() => _this ??= ControllerDelivery._();

  ControllerDelivery._();

  static ControllerDelivery? _this;


  Delivery create() {
    String currentUser = "NameUser";
    return Delivery(user: currentUser);
  }

  Future<Delivery> setTransportType(Delivery delivery,
      String transportType) async {
    await Future.delayed(const Duration(milliseconds: 100));
    delivery.transport_type = transportType;
    return delivery;
  }


}