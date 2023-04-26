import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButtom extends StatefulWidget {
  final String title;
  VoidCallback onPressed;
  CustomButtom({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blue),
      ),
      onPressed: (){
        widget.onPressed;
      },
      child: Text("${widget.title}"),
    );
  }
}
