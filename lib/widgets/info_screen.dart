import 'dart:ui';

import 'package:covid_19/constrant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfoScreenState();
  }
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
                'assets/icons/coronadr.svg', 'Get to know', 'About Covid-19'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Symptoms',
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      sickPicture(
                        'assets/images/headache.png',
                        'Headche',
                        isActive: true,
                      ),
                      sickPicture('assets/images/caugh.png', 'Caugh'),
                      sickPicture('assets/images/fever.png', 'Fever')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Prevention',
                    style: kTitleTextStyle,
                  ),
                  Prevent('assets/images/wear_mask.png', 'Wear face mask',
                      'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks'),
                  Prevent('assets/images/wash_hands.png', 'Wash your hands',
                      'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class sickPicture extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  sickPicture(this.image, this.title, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: kActiveShadowColor,
                  )
                : BoxShadow(
                    offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
          ]),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            '$title',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Prevent extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  Prevent(this.image, this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 8), blurRadius: 20, color: kShadowColor)
                ],
              ),
            ),
            Image.asset('$image'),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$title',
                      style: kTitleTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      '$subTitle',
                      style: TextStyle(fontSize: 12),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset('assets/icons/forward.svg'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
