import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Definition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Furniture You Will Love',
          style: TextStyle(
              fontFamily: 'Tahu', fontWeight: FontWeight.w700, fontSize: 100),
        ),
        Text(
            "It is a long established fact that a reader will be distracted by the readable\ncontent of a page when looking at its layout",
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            )),
        SizedBox(height: 50),
        RaisedButton(
          color: Color(0xff699272),
          elevation: 5,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          onPressed: () {},
          child: Text('EXPLORE',
              style: GoogleFonts.openSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        )
      ],
    );
  }
}
