import 'package:flutter/material.dart';
import 'package:muvver/models/delivery.dart';
import 'package:muvver/views/product_weight/product_weight.dart';

class ProductSize extends StatefulWidget {
  final Delivery;
  const ProductSize({Key? key, this.Delivery}) : super(key: key);

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    List<String> productSize = [
      'Envelope',
      'Livro',
      'Caixa de sapato',
      'Mochila',
      'Mala grande',
      'Caixa Grande',
    ];
    List<String> productSizeImage = [
      'envelope',
      'book',
      'box',
      'backpack',
      'bag',
      'bigbox'
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
              itemCount: productSize.length,
              padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                          'assets/products_types/${productSizeImage[index]}.png'),
                      SizedBox(width: 20),
                      Text(
                        productSize[index],
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
                      Navigator.pushNamed(context, '/payment');
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
                          MaterialPageRoute(builder: (context) => ProductWeight())
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
