import 'package:flutter/material.dart';

class CategoryType extends StatelessWidget {
  CategoryType(
      {super.key,
      required this.color1,
      required this.color2,
      required this.image,
      required this.label});
  String image;
  Color color1;
  Color color2;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [color1, Color.fromARGB(255, 226, 205, 205)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Center(child: Image(width: 40, image: AssetImage(image))),
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: color2,
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
