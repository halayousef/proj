import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firstHotelInfo.dart';
import 'hotelss.dart';
import 'secondHotelInfo.dart';
import 'thirdHotelInfo.dart';
import 'fourthHotelInfo.dart';

void main() {
  runApp(const Hotels());
}

class Hotels extends StatefulWidget {
  const Hotels({super.key});

  @override
  State<Hotels> createState() => _MyAppState();
}

class _MyAppState extends State<Hotels> {
  TextEditingController controller = new TextEditingController();
  List<Hotel> hotels = allHotels;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_sharp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Center(
              child: Text(
            "Hotels",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          )),
          backgroundColor: const Color(0xFF9967CE),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFBA9CF6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.purple.shade900,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        controller.clear(); //to clear textfield content
                        searchHotel(""); //to reset the search query
                      },
                    ),
                  ),
                  onChanged: searchHotel,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    final hotel = hotels[index];
                    return Card(
                      child: ListTile(
                        leading: Image.asset(
                          hotel.image,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 200,
                        ),
                        title: Text(hotel.title),
                        subtitle: Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF9967CE)),
                            SizedBox(width: 5),
                            Text(hotel.subtitle,
                                style: TextStyle(color: Color(0xFF9967CE))),
                          ],
                        ),
                        onTap: () {
                          if (hotel.title == "Gloria Golf")
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => firstHotelInfo()));
                          else if (hotel.title == "Rixos Premium Seagate")
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => secondHotelInfo()));
                          else if (hotel.title ==
                              "Dead Sea Marriott Resort & Spa")
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => thirdHotelInfo()));
                          else if (hotel.title ==
                              "Sera Lake Resort Hotel Spa & Aparts")
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fourthHotelInfo()));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchHotel(String query) {
    //بستقبل الاشي اللي عملت عليه سيرتش
    final suggestions = allHotels.where((hotelll) {
      //list of hotels
      final hotelTitle = hotelll.title.toLowerCase();
      final hotelSubtitle = hotelll.subtitle.toLowerCase();
      final input = query.toLowerCase();
      return hotelTitle.contains(input) || hotelSubtitle.contains(input);
    }).toList();
    setState(() => hotels = suggestions); //hotels:الاوتيلات اللي تفلترت
  }
}
