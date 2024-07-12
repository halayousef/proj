import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class room_hotel_2 extends StatefulWidget {
  const room_hotel_2({super.key});

  @override
  State<room_hotel_2> createState() => _RoomState();
}

class _RoomState extends State<room_hotel_2> {
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
                  image: AssetImage("images/room2.webp"),
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
            child: Center(child: Text("Living room" , style: TextStyle(fontSize: 20),)),
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
                  image: AssetImage("images/bed2.webp"),
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
            child: Center(child: Text("Bedroom" , style: TextStyle(fontSize: 20),)),
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
                  image: AssetImage("images/bathroom2.webp"),
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
            child: Center(child: Text("Bathroom" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}
