import 'package:flutter/material.dart';

import '../transport_type/transport_type.dart';
import 'widgets/button_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: RichText(
                  text: const TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Facilitando seus '),
                      TextSpan(
                          text: 'envios.',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Entregue ou envie.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: ButtonService(
                      title: "Remetente",
                      subtitle: "Pra onde quer enviar seu objeto?",
                      imageAsset: 'assets/images/ic-box.png',
                      onPressed: () {})),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ButtonService(
                  title: "Viajante",
                  subtitle: "Vai viajar para onde?",
                  imageAsset: 'assets/images/delivery-truck.png',
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransportType())
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notificações'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus), label: 'Entregas'),
        ],
      ),
    );
  }

  PreferredSize buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
              margin: EdgeInsets.fromLTRB(16, 30, 0, 0),
              child: Image.asset(
                'assets/images/logo.png',
              )),
        ),
      );
}
