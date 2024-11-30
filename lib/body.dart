import 'package:flutter/material.dart';
import 'package:sample_project/screens/profile_screen.dart';
import 'package:sample_project/functions/body_functions.dart';
import 'package:sample_project/screens/patients_screen.dart';
import 'package:sample_project/screens/records_screen.dart'; 
import 'package:sample_project/main.dart'; 

class Body extends StatefulWidget {
  final List<Map<String, dynamic>> records = []; 

  Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildMenu(),
            const SizedBox(height: 20),
            _buildMetrics(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          BottomNavigationHandler.onItemTapped(
              context, index); 
        },
        backgroundColor: Colors.lightBlue[600],
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[600],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nutrition Center',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Check your height, weight, and BMI.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          _buildListTile(
            context,
            icon: Icons.person,
            title: 'View Profile',
            destination: ProfileScreen(),
          ),
          _buildListTile(
            context,
            icon: Icons.view_list,
            title: 'View Patients',
            destination: const PatientsScreen(),
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.lightBlue),
            title: const Text('View Records'),
            trailing: const Icon(Icons.chevron_right, color: Colors.lightBlue),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordsScreen(
                    patient: RecordLogic.getPatients()[
                        0], 
                  ),
                ),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.exit_to_app,
            title: 'Logout',
            destination: MyApp(),
          ),
        ],
      ),
    );
  }

  Widget _buildMetrics() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMetricBox(Icons.height, 'Height', ProfileData.getHeight()),
              _buildMetricBox(
                  Icons.monitor_weight, 'Weight', ProfileData.getWeight()),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'BMI Category: Normal weight',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Normal weight is a good category; keep up the good health condition.',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required Widget destination}) {
    return ListTile(
      leading: Icon(icon, color: Colors.lightBlue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.lightBlue),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }

  Widget _buildMetricBox(IconData icon, String title, String value) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.lightBlue),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
