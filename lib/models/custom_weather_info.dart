import 'package:flutter/material.dart';

class WeatherInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String data;

  const WeatherInfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // ← هنا المفتاح الحقيقي
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min, // ← تخلي الصف على قد محتواه فقط
          mainAxisAlignment: MainAxisAlignment.center, // ← توسيط العناصر
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              '$label : $data',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
