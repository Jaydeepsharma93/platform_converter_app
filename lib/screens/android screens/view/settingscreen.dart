import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
                size: 35,
              ),
              title: Text('Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              subtitle:
                  Text('Update Profile Data', style: TextStyle(fontSize: 16)),
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.wb_sunny_outlined,
                size: 35,
              ),
              title: Text('Theme',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              subtitle: Text("Change Theme", style: TextStyle(fontSize: 16)),
              trailing: Switch(
                value: false,
                onChanged: (value) {
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
