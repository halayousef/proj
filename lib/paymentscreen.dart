import 'package:flutter/material.dart';
import 'reservationscreen.dart';

void main() {
  runApp(MaterialApp(
    home: PaymentScreen()));
}

class PaymentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final List<String> paymentMethods = [
    'VISA Card',
    'Master Card',
    'Bank Transfer'
  ];
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9967CE),
          title: Row(
            children: [
              Icon(Icons.hotel_class_outlined),
              SizedBox(width: 18),
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
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: selectedPaymentMethod,
                  onChanged: (String? newValue) {
                    selectedPaymentMethod = newValue!;
                  },
                  items: paymentMethods.map((String paymentMethod) {
                    return DropdownMenuItem<String>(
                      value: paymentMethod,
                      child: Text(paymentMethod),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Payment Method',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                    hintText: 'Enter card number',
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter a valid number";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          border: OutlineInputBorder(),
                          hintText: 'MM/YY',
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter a date";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Card Verification Code',
                            border: OutlineInputBorder(),
                            hintText: 'CVV',
                            prefixIcon: Icon(Icons.credit_card)),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter the correct verification code";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Cardholder Name',
                      border: OutlineInputBorder(),
                      hintText: 'Enter cardholder name',
                      prefixIcon: Icon(Icons.person)),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm payment'),
                            content: Text('payment confirmed'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Pay Now'),
                ),
              )


              ],
            ),
          ),
        )));
  }
}
