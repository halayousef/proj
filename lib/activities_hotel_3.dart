import 'package:flutter/material.dart';

class activities_hotel_3 extends StatefulWidget {
  const activities_hotel_3({super.key});

  @override
  State<activities_hotel_3> createState() => _activities_hotel_3State();
}

class _activities_hotel_3State extends State<activities_hotel_3> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                KidsClub(),
                SizedBox(width: 10,),
                Spa(),
                SizedBox(width: 10,),
                Wedding(),
              ],
            ),
          ),
        ),
      ],
    );

  }
}
class KidsClub extends StatelessWidget {
  const KidsClub({super.key});

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/kidsclub3.jpg"),
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
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(child: Text("Kids Club" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}

class Spa extends StatelessWidget {
  const Spa({super.key});

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/spa3.webp"),
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
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(child: Text("Spa" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}

class Wedding extends StatelessWidget {
  const Wedding({super.key});

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/wedding3.webp"),
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
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(child: Text("Wedding" , style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }
}
