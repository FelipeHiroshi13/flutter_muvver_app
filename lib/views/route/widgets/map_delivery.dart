import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muvver/controllers/route/map_delivery_controller.dart';
import 'package:provider/provider.dart';

class MapDelivery extends StatefulWidget {
  const MapDelivery({Key? key}) : super(key: key);

  @override
  State<MapDelivery> createState() => _MapDeliveryState();
}

class _MapDeliveryState extends State<MapDelivery> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ControllerMapDelivery>(
      create: (context) => ControllerMapDelivery(),
      child: Builder(builder: (context){
        final local = context.watch<ControllerMapDelivery>();

        void addMark(LatLng pos){
          setState(() {
            local.addMarker(pos);
          });
        }

        return GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(-20.4353, -54.647820), zoom: 10),
          zoomControlsEnabled: true,
          mapType: MapType.normal,
          onMapCreated: local.onMapCreated,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            new Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer(),
            ),
          ].toSet(),
          markers: {
            if (local.origin != null) local.origin!,
            if (local.destination != null) local.destination!
          },
          onLongPress: addMark,
        );
      },),
    );
  }

}
