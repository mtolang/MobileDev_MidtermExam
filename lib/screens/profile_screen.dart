import 'package:flutter/material.dart';
import '../functions/profile_functions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "John Doe";
  String email = "johndoe@example.com";
  String phone = "+1 (555) 123-4567";
  String biography =
      "I am a dedicated physician with over 10 years of experience in internal medicine. I graduated from Harvard Medical School and completed my residency at Johns Hopkins Hospital. I have a keen interest in preventive care and chronic disease management. I am passionate about educating my patients on healthy lifestyle choices and often participate in community health programs. Outside of work, I enjoy hiking, reading, and spending time with my family.";
  String weight = "70 kg";
  String height = "1.75 m";

  void _editProfile() {
    ProfileFunctions.editProfileDialog(
      context,
      name,
      email,
      phone,
      biography,
      weight,
      height,
      (updatedName, updatedEmail, updatedPhone, updatedBio, updatedWeight,
          updatedHeight) {
        setState(() {
          name = updatedName;
          email = updatedEmail;
          phone = updatedPhone;
          biography = updatedBio;
          weight = updatedWeight;
          height = updatedHeight;
        });
      },
    );
  }

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
                  child: Text(
                    name.split(' ').map((e) => e[0]).take(2).join(),
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      email,
                      style: const TextStyle(
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
                  onPressed: _editProfile,
                  tooltip: 'Edit',
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.lightBlue),
                const SizedBox(width: 10),
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(Icons.monitor_weight, color: Colors.lightBlue),
                const SizedBox(width: 10),
                Text(
                  'Weight: $weight',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(Icons.height, color: Colors.lightBlue),
                const SizedBox(width: 10),
                Text(
                  'Height: $height',
                  style: const TextStyle(
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
            Text(
              biography,
              style: const TextStyle(
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
