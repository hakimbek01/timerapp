import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // return Container(
    //   width: double.infinity,
    //   height: double.infinity,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Text(
    //         '$hoursStr:$minutStr:$secondStr',
    //         style: TextStyle(
    //             fontSize: 40
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
