import 'dart:io';

import 'package:covid_19/constrant.dart';
import 'file:///D:/Flutter/covid_19/lib/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins',
          textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedValue = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
                'assets/icons/Drcorona.svg', 'All yoy need', 'is stay at home'),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black38),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedValue,
                        onChanged: (String value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                        items: [
                          'Indonesia',
                          'Ha Noi',
                          'United States',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Case Update\n',
                            style: kTitleTextStyle,
                          ),
                          TextSpan(
                              text: 'Newest update Match 28',
                              style: TextStyle(
                                color: kTextLightColor,
                              ))
                        ]),
                      ),
                      Spacer(),
                      Text('see details',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Counter(1046, 'Infected', kInflectedColor),
                  Counter(87, 'Deaths', kDeathColor),
                  Counter(46, 'Recovered', kRecoverColor),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: <Widget>[
                RichText(
                  text:
                      TextSpan(text: 'Spread of Virus', style: kTitleTextStyle),
                ),
                Spacer(),
                RichText(
                    text: TextSpan(
                        text: 'see details',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        )))
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: kShadowColor)
                  ]),
              child: Image.asset(
                'assets/images/map.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
