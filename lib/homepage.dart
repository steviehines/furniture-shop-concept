import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furniture_store_app/methods/chair.dart';
import 'package:furniture_store_app/methods/definition.dart';
import 'package:furniture_store_app/methods/shape_paint.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Stack(
        children: [
          Container(
            height: _height,
            width: _width,
            child: CustomPaint(painter: ShapePainter()),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
            height: _height,
            width: _width,
            child: Column(
              children: [
                SizedBox(height: _width * 0.02),
                NavBar(),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Definition(),
                      flex: 6,
                    ),
                    Expanded(
                      child: Chair(),
                      flex: 4,
                    )
                  ],
                )),
                Container(
                  width: _width,
                  height: _width * 0.05,
                )
              ],
            ),
          ),
          Positioned(
            child: Container(
              width: _width,
              height: _width * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff699272),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      width: _width * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: chairList.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              height: 100,
                              width: 250,
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        offset: Offset(5, 5),
                                        blurRadius: 5,
                                        spreadRadius: 5),
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.asset(chairList[i].image)),
                                  Text(
                                    chairList[i].name,
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    chairList[i].price,
                                    style: GoogleFonts.openSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            );
                          })),
                  CircleAvatar(
                    backgroundColor: Color(0xff699272),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            bottom: 0,
          )
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/images/logo.png', height: 30, width: 30),
        SizedBox(width: 10),
        Text(
          'Wood',
          style: TextStyle(fontSize: 40, fontFamily: 'Euphoria'),
        ),
        Spacer(),
        Text(
          'Home',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Display'),
        ),
        SizedBox(width: 40),
        Text(
          'Furniture',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Display'),
        ),
        SizedBox(width: 40),
        Text(
          'Product',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Display'),
        ),
        SizedBox(width: 40),
        Text(
          'Store',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Display'),
        ),
        SizedBox(width: 40),
        Image.asset('assets/images/search.png', height: 30, width: 30),
        SizedBox(width: 40),
        Image.asset('assets/images/shopping-cart.png', height: 30, width: 30),
        SizedBox(width: 100),
      ],
    );
  }
}
