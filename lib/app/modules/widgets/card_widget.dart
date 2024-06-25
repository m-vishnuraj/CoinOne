import 'dart:ui';

import 'package:coin_one/constants.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String Name;
  final String Img;

  const CardWidget({
    super.key,
    required this.Name,
    required this.Img,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 0.5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      Img,
                    ),
                  ),
                ),
                kWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
