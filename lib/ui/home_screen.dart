import 'package:flutter/material.dart';
import '../send_or_update_data_screen.dart';
import 'side_screen.dart';
import '../send_or_update_data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Nonton series apa hari ini',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20), // Spacer
        ],
      ),
      drawer: const SideScreen(),
    );
  }
}
