import 'package:flutter/material.dart';
import 'package:sample_project/screens/login.dart';
import 'package:sample_project/screens/profile_screen.dart';
import 'package:sample_project/screens/patients_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
        centerTitle: true,
        backgroundColor: Colors.lightBlue[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                  Text(
                    'Approach a nutritionist',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              color: Colors.white,
              child: Column(
                children: [
                  _buildListTile(
                    context,
                    icon: Icons.person,
                    title: 'View Profile',
                    destination: const ProfileScreen(),
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.view_list,
                    title: 'View Patient',
                    destination: const PatientsScreen(),
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.exit_to_app,
                    title: 'Logout',
                    destination: const LoginScreen(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMetricBox(Icons.height, 'Height', '1.75 m'),
                      _buildMetricBox(Icons.monitor_weight, 'Weight', '70 kg'),
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info_outline,
                            color: Colors.lightBlue),
                        onPressed: () {
                          _showCategoryInfo(context);
                        },
                      ),
                      const Text(
                        'What does this mean?',
                        style: TextStyle(fontSize: 18, color: Colors.lightBlue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
      trailing: const Text(
        '>',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlue,
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destination));
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

  void _showCategoryInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('BMI Categories'),
          content: const Text(
            '• Underweight: BMI < 18.5\n'
            '• Normal weight: BMI 18.5–24.9\n'
            '• Overweight: BMI 25–29.9\n'
            '• Obesity: BMI ≥ 30',
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
