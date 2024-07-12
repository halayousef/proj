import 'package:flutter/material.dart';

class Hotel {
  final String title;
  final String subtitle;
  final String image;

  const Hotel({required this.title, required this.subtitle, required this.image});
}

const allHotels = [
  Hotel(
    title: "Gloria Golf",
    subtitle:"Antalya, Turkey",
    image:"images/gloria_golf.jpg",
    ),

  Hotel(
      title: "Sera Lake Resort Hotel Spa & Aparts",
      subtitle: "Trabzon, Turkey",
      image: "images/trabzon1.jpg"
  ),

  Hotel(
    title: "Rixos Premium Seagate",
    subtitle:"Sharm El Sheikh, Egypt",
    image: "images/rixos_premium_seagate.jpg",
  ),

  Hotel(
    title: "Dead Sea Marriott Resort & Spa",
    subtitle:"Dead Sea, Jordan",
    image: "images/marriott_resort.jpg",
  ),

];
