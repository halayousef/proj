import 'package:flutter/material.dart';
import 'package:flutter_proj/activities_hotel_4.dart';
import 'package:flutter_proj/hotelss.dart';
import 'room_hotel_4.dart';
import 'activities_hotel_4.dart';
import 'food_hotel_4.dart';
import 'reservationscreen.dart';



class fourthHotelInfo extends StatefulWidget {
  const fourthHotelInfo({super.key});

  @override
  State<fourthHotelInfo> createState() => _fourthHotelInfoState();
}

class _fourthHotelInfoState extends State<fourthHotelInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sera Lake Resort Hotel Spa & Aparts"),
          backgroundColor: const Color(0xFF9967CE),
        ),
        body:Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Rooms:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                room_hotel_4(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Activities:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                activities_hotel_4(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Food:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              food_hotel_4(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Reservation Confirmation'),
                              content: Text('Do you want to confirm your reservation?'),
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
                      child: Text(
                        "Reserve Now!",
                        style: TextStyle(color: Colors.purple),
                      ),
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
