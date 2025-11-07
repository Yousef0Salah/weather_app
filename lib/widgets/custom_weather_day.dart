import 'package:flutter/material.dart';

class CustomWeatherDay extends StatelessWidget {
  const CustomWeatherDay({super.key, required this.label, required this.data,n});
  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(32),
      ),
      width: 170,
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          
        ],
      ),
    );
  }
}
