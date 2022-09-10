import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muvver/models/delivery.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ControllerMapDelivery extends ChangeNotifier {
  GoogleMapController? _googleMapController;

  Marker? origin;
  Marker? destination;

  LatLng? beginPoint;
  LatLng? endPoint;

  CameraPosition? cameraPosition;

  get googleMapController => _googleMapController;

  onMapCreated(GoogleMapController gmc) async {
    //TODO
    //POSICAO INICIAL - CIDADE DE ORIGEM
    //POSICAO FINAL
    _googleMapController
        ?.animateCamera(CameraUpdate.newLatLng(LatLng(-20.4353, -54.647820)));
    cameraPosition =
        new CameraPosition(target: LatLng(-20.4353, -54.647820), zoom: 10);
  }

  Future<Delivery> create(String transportType) async {
    await Future.delayed(Duration(milliseconds: 100));
    String _currentUser = "NameUser";
    return Delivery(user: _currentUser, transport_type: transportType);
  }

  void addMarker(LatLng pos) {
    if (origin == null || (origin != null && destination != null)) {
      origin = Marker(
        markerId: const MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'Origem'),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      );
      destination = null;
    } else {
      destination = Marker(
        markerId: const MarkerId('destination'),
        infoWindow: const InfoWindow(title: 'Destino'),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      );
    }
  }
}
