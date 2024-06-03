import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/header.dart';
import '../widgets/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsModel(),
      child: Consumer<SettingsModel>(
        builder: (context, settings, child) {
          return MaterialApp(
            theme: settings.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: SettingsScreen(),
          );
        },
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    await settingsModel.loadSettings('userId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: Provider.of<SettingsModel>(context).isDarkMode,
            onChanged: (bool value) {
              Provider.of<SettingsModel>(context, listen: false)
                  .setDarkMode(value);
            },
            secondary: Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: Text('Notifications'),
            value: Provider.of<SettingsModel>(context).notificationsEnabled,
            onChanged: (bool value) {
              Provider.of<SettingsModel>(context, listen: false)
                  .setNotificationsEnabled(value);
            },
            secondary: Icon(Icons.notifications),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('English'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to language settings
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to password settings
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Security and Two-factor authentication'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to security settings
            },
          ),
          ListTile(
            leading: Icon(Icons.perm_device_information),
            title: Text('Permissions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to permissions settings
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to about page
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Terms and Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to terms and privacy policy page
            },
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class SettingsModel extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;

  bool get isDarkMode => _isDarkMode;
  bool get notificationsEnabled => _notificationsEnabled;

  void setDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    await saveSettings('userId');
  }

  void setNotificationsEnabled(bool value) async {
    _notificationsEnabled = value;
    notifyListeners();
    await saveSettings('userId');
  }

  Future<void> loadSettings(String userId) async {
    final response = await http.get(Uri.parse('http://localhost:3000/settings/$userId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _isDarkMode = data['isDarkMode'];
      _notificationsEnabled = data['notificationsEnabled'];
      notifyListeners();
    } else {
      throw Exception('Failed to load settings');
    }
  }

  Future<void> saveSettings(String userId) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/settings/$userId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'isDarkMode': _isDarkMode,
        'notificationsEnabled': _notificationsEnabled,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to save settings');
    }
  }
}
