import 'package:flutter/material.dart';
import 'package:flut/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadNotificationPreference();
  }

  // Load notification preference from SharedPreferences
  Future<void> _loadNotificationPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotificationEnabled = prefs.getBool('notifications') ?? true; // Default is true
    });
  }

  // Save notification preference to SharedPreferences
  Future<void> _saveNotificationPreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('notifications', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Constants.primaryColor,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifications'),
            value: _isNotificationEnabled,
            onChanged: (bool value) {
              setState(() {
                _isNotificationEnabled = value;
              });
              _saveNotificationPreference(value); // Save preference
            },
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('English'),
            onTap: () {
              // Handle language selection
            },
          ),
        ],
      ),
    );
  }
}
