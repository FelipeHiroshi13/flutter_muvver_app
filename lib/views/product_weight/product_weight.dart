import 'package:flutter/material.dart';
import 'package:muvver/views/payment/payment.dart';

class ProductWeight extends StatefulWidget {
  const ProductWeight({Key? key}) : super(key: key);

  @override
  State<ProductWeight> createState() => _ProductWeightState();
}

class _ProductWeightState extends State<ProductWeight> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    List<String> productWeight = [
      'Até 1 kg',
      'Até 5 kg',
      'Até 10 kg',
      'Até 20 kg',
      'Outro',
    ];

    List<String> productWeightImage = [
      'balance_1',
      'balance_2',
      'balance_3',
      'balance_4',
      'balance_5',
    ];

    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: Text(
              "Tamanhos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: productWeight.length,
              padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                          'assets/products_weight/${productWeightImage[index]}.png'),
                      SizedBox(width: 20),
                      Text(
                        productWeight[index],
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
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Payment())
                      );
                    },
                    child: const Text(
                      "Pular Etapa",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 5,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Payment())
                      );
                    },
                    child: const Text(
                      "Avançar",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ))
        ],
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
              "Qual o peso do volume?",
              style: TextStyle(fontSize: 20, color: Colors.white,),
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
