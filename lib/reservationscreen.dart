import 'package:flutter/material.dart';
import 'hotelss.dart';
import 'paymentscreen.dart';


void main() {
  runApp(MaterialApp(
    home: ReservationScreen(),
  ));
}

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime _selectedDate = DateTime.now();
  int Guests = 1;
  int NumOfDays = 1;
  bool food=false;

  void _selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2222),
    ).then((pickedDate) {
      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9967CE),
        title: Row(
          children: [
            Icon(Icons.hotel_class_outlined), // Add an icon before the text
            SizedBox(
                width: 18), // Add some spacing between the icon and the text
            Text("Hotel Hub",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reservation Details",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Booking Date:",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  )),
              trailing: Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              ),
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.people),
              title: Text(
                "Guests:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              trailing: DropdownButton<int>(
                value: Guests,
                onChanged: (newValue) {
                  setState(() {
                    Guests = newValue!;
                  });
                },
                items: List.generate(
                  10,
                  (index) => DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Booking Days:",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  )),
              trailing: DropdownButton<int>(
                value: NumOfDays,
                onChanged: (newValue) {
                  setState(() {
                    NumOfDays = newValue!;
                  });
                },
                items: List.generate(
                  10,
                  (index) => DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text("Breakfast and dinner included?",
                  style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              )),
              trailing: DropdownButton<bool>(
                value: food,
                onChanged: (newValue) {
                  setState(() {
                    food = newValue!;
                  });
                },
              items: [
                DropdownMenuItem<bool>(
                  value: true,
                  child: Text("Yes"),
                ),
                DropdownMenuItem<bool>(
                  value: false,
                  child: Text("No"),
                ),
              ],
            ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));

                },
                child: Text("Confirm Reservation"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
