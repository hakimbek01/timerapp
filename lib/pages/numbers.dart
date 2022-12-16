import 'package:flutter/material.dart';

class Numbers extends StatefulWidget {
  final int min;
  const Numbers({Key? key, required this.min}) : super(key: key);

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(widget.min<10? '0${widget.min}':widget.min.toString(),style:TextStyle(fontSize: 37,color: Colors.white) ,)
      ),
    );
  }
}
