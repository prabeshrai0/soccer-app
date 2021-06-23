import 'package:flutter/material.dart';

Widget teamStat(String team, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Text(
          team,
          style: TextStyle(
            fontSize: 18.0,

          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,

          ),
        ),
      ],
    ),
  );
}