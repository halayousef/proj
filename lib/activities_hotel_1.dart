import 'package:flutter/material.dart';

class activities_hotel_1 extends StatefulWidget {
  const activities_hotel_1({super.key});

  @override
  State<activities_hotel_1> createState() => _activities_hotel_1State();
}

class _activities_hotel_1State extends State<activities_hotel_1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                LivingRoom(),
                SizedBox(width: 10,),
                Bedroom(),
                SizedBox(width: 10,),
                Bathroom(),
              ],
            ),
          ),
        ),
      ],
    );

  }
}
class LivingRoom extends StatelessWidget {
  const LivingRoom({super.key});

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
                  image: AssetImage("images/golf.jpg"),
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
            child: Center(child: Text("Golf", style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}

class Bedroom extends StatelessWidget {
  const Bedroom({super.key});

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
                  image: AssetImage("images/yoga.jpg"),
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
            child: Center(child: Text("Yoga", style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}

class Bathroom extends StatelessWidget {
  const Bathroom({super.key});

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
            child: Center(child: Text("Sweets" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}
