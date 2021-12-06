import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String hour = DateFormat('kk:mm').format(now);
    String day = DateFormat('EEEE, dd MMM').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
              image: AssetImage('assets/img/logo/logo.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(hour),
                Text(day),
              ],
            )
          ],
        ),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
