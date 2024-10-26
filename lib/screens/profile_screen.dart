import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[600],
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.lightBlue[200],
                  child: const Text(
                    'JD',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'johndoe@example.com',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.lightBlue),
                  onPressed: () {
                    print("Edit button pressed");
                  },
                  tooltip: 'Edit',
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Row(
              children: <Widget>[
                Icon(Icons.phone, color: Colors.lightBlue),
                SizedBox(width: 10),
                Text(
                  '+1 (555) 123-4567',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.lightBlue),
                SizedBox(width: 10),
                Text(
                  '123 Main St, Springfield, USA',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Biography',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'I am a dedicated physician with over 10 years of experience in internal medicine. I graduated from Harvard Medical School and completed my residency at Johns Hopkins Hospital. I have a keen interest in preventive care and chronic disease management. I am passionate about educating my patients on healthy lifestyle choices and often participate in community health programs. Outside of work, I enjoy hiking, reading, and spending time with my family.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
