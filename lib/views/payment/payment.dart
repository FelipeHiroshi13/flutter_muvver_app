import 'package:flutter/material.dart';

import '../finish_delivery/finish_delivery.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double _currentSliderPrice = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Preço de entrega",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Valor Sugerido",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  Slider(
                    value: _currentSliderPrice,
                    max: 1000,
                    divisions: 1000,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderPrice = value;
                      });
                    },
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    "R\$ ${_currentSliderPrice.toInt()},00",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Clique no valor acima, para um preço mais específico",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinishDelivery())
                );
              },
              child: const Text(
                "Avançar",
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),


          ],
        ),
      ),
    );
  }

  PreferredSize buildAppBar(BuildContext context) => PreferredSize(
      preferredSize: Size.fromHeight(151),
      child: AppBar(
        title: const Text(
          "Ser um muvver",
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
              "Definir preço mínimo do deslocamento?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
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
