import 'package:flutter/material.dart';

class Filtterfind extends StatefulWidget {
  const Filtterfind({super.key});

  @override
  State<Filtterfind> createState() => _FiltterfindState();
}

class _FiltterfindState extends State<Filtterfind> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '243 items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'found',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
