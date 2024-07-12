import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class food_hotel_1 extends StatefulWidget {
  const food_hotel_1({super.key});

  @override
  State<food_hotel_1> createState() => _food_hotel_1State();
}

class _food_hotel_1State extends State<food_hotel_1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Breakfast(),
                SizedBox(width: 10,),
                Lunch(),
                SizedBox(width: 10,),
                Dinner(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Breakfast extends StatelessWidget {
  const Breakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/gloria_golf_breakfast.jpg"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(child: Text("Breakfast" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}

class Lunch extends StatelessWidget {
  const Lunch({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/gloria_golf_lunch.webp"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(child: Text("Lunch" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}

class Dinner extends StatelessWidget {
  const Dinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/gloria-golf-resort-dining-1.jpg"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(child: Text("Dinner" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}
