import 'package:flutter/material.dart';

class ButtonService extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final VoidCallback onPressed;

  const ButtonService(
      {Key? key,
        required this.title,
        required this.subtitle,
        required this.imageAsset,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.black, Colors.black87],
            ),
            borderRadius: BorderRadius.circular(3.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 500.0, minHeight: 129.0),
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 200),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Image.asset(imageAsset))
            ],
          ),
        ),
      ),
    );
  }
}
