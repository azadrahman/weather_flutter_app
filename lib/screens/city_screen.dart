import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Icon(Icons.arrow_left, size: 50, color: Colors.white,)),
              SizedBox(height: 24,),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(Icons.location_city, color: Colors.white, size: 40,),
                  hintText: 'Enter a city name',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
              SizedBox(height: 24),
              Center(child: ElevatedButton(onPressed: () {
                Navigator.pop(context, cityName);
              }, child: Text('Get Weather'))),
            ],
          ),
        ),
      ),
    );
  }
}
