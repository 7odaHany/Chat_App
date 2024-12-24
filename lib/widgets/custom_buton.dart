import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButon extends StatelessWidget {
  CustomButon({this.onTap, Key? key, required this.text}) : super(key: key);
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    );
  }
}
