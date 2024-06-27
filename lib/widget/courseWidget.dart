import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CourceWidget extends StatelessWidget {
  CourceWidget(
      {super.key,
      required this.itemName,
      required this.color1,
      required this.color2,
      required this.image});
  String itemName;
  Color color1;
  Color color2;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DottedBorder(
          borderType: BorderType.Circle,
          color: Theme.of(context).primaryColor,
          strokeWidth: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70.0,
              width: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [color2, color1],
                ),
              ),
              child: Center(
                child: Image(
                  width: 40,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          itemName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: const Color.fromARGB(255, 55, 55, 55),
          ),
        ),
      ],
    );
  }
}
