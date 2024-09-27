import 'package:flutter/material.dart';
import 'package:sample_project/fifth_screen.dart';
import 'package:sample_project/first_screen.dart';
import 'package:sample_project/fourth_screen.dart';
import 'package:sample_project/second_screen.dart';
import 'package:sample_project/third_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My App',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // title: Center(
        //   // child: Text('My App'),
        // ),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'First Screen',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => First()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Second Screen',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Second()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Third Screen',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Third()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Fourth Screen',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fourth()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Fifth Screen',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fifth()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
