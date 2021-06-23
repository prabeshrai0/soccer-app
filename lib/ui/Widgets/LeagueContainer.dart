import 'package:flutter/material.dart';

class LeagueContainer extends StatelessWidget {
  final String image;

  const LeagueContainer({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Image.asset(image),
    );
  }
}
