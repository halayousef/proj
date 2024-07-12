import 'package:flutter/material.dart';

class activities_hotel_4 extends StatefulWidget {
  const activities_hotel_4({super.key});

  @override
  State<activities_hotel_4> createState() => _activities_hotel_4State();
}

class _activities_hotel_4State extends State<activities_hotel_4> {
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
                  image: AssetImage("images/turkishbath.jpg"),
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
            child: Center(child: Text("TurkishBath", style: TextStyle(fontSize: 20),)),
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
                  image: AssetImage("images/gym.webp"),
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
            child: Center(child: Text("GYM", style: TextStyle(fontSize: 20),)),
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
                  image: AssetImage("images/childrenarea.jpg"),
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
            child: Center(child: Text("ChildrenArea" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}
