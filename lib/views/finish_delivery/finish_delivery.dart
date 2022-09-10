import 'package:flutter/material.dart';

class FinishDelivery extends StatefulWidget {
  const FinishDelivery({Key? key}) : super(key: key);

  @override
  State<FinishDelivery> createState() => _FinishDeliveryState();
}

class _FinishDeliveryState extends State<FinishDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Image.asset('assets/finish_delivery/paper-airplane.png'),
            Text(
              "Viagem criada",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Vamos ver os volumes já disponíveis para a sua viagem.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Ao prosseguir, você declara para efeitos legais, "
                  "administrativos, jurídicos e demais aplicáveis, a veracidade de "
                  "todas as informações"
                  " prestadas antes, durante e após qualquer uma das etapas do app.",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50)),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  "Visualizar Volumes",
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
