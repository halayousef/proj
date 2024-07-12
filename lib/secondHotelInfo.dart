import 'package:flutter/material.dart';

import 'activities_hotel_2.dart';
import 'food_hotel_2.dart';
import 'room_hotel_2.dart';

import 'reservationscreen.dart';



class secondHotelInfo extends StatelessWidget {
  const secondHotelInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rixos Premium Seagate"),
          backgroundColor: const Color(0xFF9967CE),
        ),
        body: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Room:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                room_hotel_2(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Activities:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                activities_hotel_2(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Food:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                food_hotel_2(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Reservation Confirmation'),
                              content: Text(
                                  'Do you want to confirm your reservation?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReservationScreen()));
                                  },
                                  child: Text('Confirm'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text("reserve now!",style: TextStyle(color: Colors.purple),),
                    ),
                  ),
                ),
                SizedBox(height: 5,)
              ],
            ) ,
          ),
        )
    );
  }
}
