import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muvver/models/delivery.dart';
import 'package:muvver/views/route/widgets/city_picker.dart';

import '../../controllers/route/controller_details_delivery.dart';
import '../product_size/product_size.dart';
import 'widgets/date_picker.dart';
import 'widgets/map_delivery.dart';

class RouteDelivery extends StatefulWidget {
  const RouteDelivery({
    Key? key,
    required this.delivery,
  }) : super(key: key);

  @required
  final Delivery delivery;

  @override
  State<RouteDelivery> createState() => _RouteDeliveryState(delivery);
}

class _RouteDeliveryState extends State<RouteDelivery> {
  @required
  Delivery delivery;

  _RouteDeliveryState(this.delivery);

  final _controllerDetailsDelivery = new ControllerDetailsDelivery();

  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'Rotas'),
    Tab(text: 'Mapa'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: TabBarView(
            children: [
              detailsDelivery(context),
              MapDelivery(),
            ],
          ),
        ));
  }

  Widget detailsDelivery(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Selecione a data e rota da sua viagem",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DataPicker(
                  text: 'Data de partida',
                  controlsDetailsDelivery: _controllerDetailsDelivery,
                ),
                SizedBox(
                  width: 20,
                ),
                DataPicker(
                  text: 'Data de chegada',
                  controlsDetailsDelivery: _controllerDetailsDelivery,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CityPicker(title: 'Cidade de origem'),
            SizedBox(
              height: 20,
            ),
            CityPicker(title: 'Cidade de destino'),
            SizedBox(
              height: 40,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Text(
                        "Adicionar ponto intermediário",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "E aumente sua chance de match",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  )
                ],
              ),
              onTap: () {
                //Todo
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: () {
                  delivery =
                      _controllerDetailsDelivery.setDetailsDelivery(delivery);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductSize(
                                Delivery: delivery,
                              )));
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

  PreferredSize buildAppBar(BuildContext context) => PreferredSize(
      preferredSize: Size.fromHeight(151),
      child: AppBar(
        title: const Text(
          "Viajante",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black, Colors.black],
          )),
        ),
        actions: [
          TextButton(
            child: Text(
              "Cancelar",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Qual o trajeto da sua viagem?",
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              ),
              TabBar(
                tabs: _tabs,
                indicatorColor: Colors.white,
              )
            ],
          ),
        ),
      ));

  @override
  void dispose() {
    super.dispose();
    _controllerDetailsDelivery.dispose();
  }
}
