import 'package:flutter/material.dart';
import 'package:muvver/models/delivery.dart';
import 'package:muvver/views/route/route.dart';

import '../../controllers/home/controller_delivery.dart';

class TransportType extends StatefulWidget {
  const TransportType({Key? key}) : super(key: key);

  @override
  State<TransportType> createState() => _TransportTypeState();
}

class _TransportTypeState extends State<TransportType> {
  int? _value = 0;

  final _controllerDelivery = new ControllerDelivery();

  late Delivery delivery;


  @override
  void initState(){
    delivery =  _controllerDelivery.create();
  }

  @override
  Widget build(BuildContext context) {
    List<String> vehicles = [
      'Carro',
      'Avião',
      'Caminhão',
      'Van',
      'Moto',
      'Bicicleta',
      'Trem',
      'Ônibus',
      'Embarcação'
    ];
    List<String> imagesVehicles = [
      'car',
      'airplane',
      'truck',
      'van',
      'moto',
      'bike',
      'train',
      'bus',
      'boat'
    ];


    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: Text(
              "Transporte",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: vehicles.length,
              padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                          'assets/transports_types/${imagesVehicles[index]}.png'),
                      SizedBox(width: 20),
                      Text(
                        vehicles[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Radio(
                          value: index,
                          groupValue: _value,
                          onChanged: (int? value) {
                            setState(() {
                              print(value.toString());
                              _value = value;
                            });
                          })
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: () {
                _controllerDelivery
                    .setTransportType(delivery, vehicles[_value!])
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RouteDelivery(
                                  delivery: value,
                                ))));
              },
              child: const Text(
                "Avançar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSize buildAppBar(BuildContext context) => PreferredSize(
      preferredSize: Size.fromHeight(151),
      child: AppBar(
        title: const Text(
          "Viajante",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black, Colors.black],
          )),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Qual será o meio de transporte da sua viagem?",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ));
}
