import 'package:dark_mode_getx/getx_controller.dart';
import 'package:dark_mode_getx/shared_preferences.dart';
import 'package:dark_mode_getx/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // await sp.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DARK MODE TEST'),
      ),
      body: Center(
        child: ObxValue(
            // (data) => Switch(
            //       value: isLightTheme.value,
            //       onChanged: (value) {
            //         Get.changeThemeMode(
            //             isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
            //         isLightTheme.value = !isLightTheme.value;
            //         saveThemeMode();
            //       },
            //     ),
            (data) => SelectSwitch(),
            false.obs),
      ),
    );
  }
}

Widget SelectSwitch() {
  String val = screenTheme.value;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ListTile(
        title: Text("LIGHT"),
        leading: Radio(
          value: 'light',
          groupValue: val,
          onChanged: (value) {
            screenTheme.value = 'light';
            Get.changeThemeMode(ThemeMode.light);
          },
          activeColor: Colors.green,
        ),
      ),
      ListTile(
        title: Text("DARK"),
        leading: Radio(
          value: 'dark',
          groupValue: val,
          onChanged: (value) {
            screenTheme.value = 'dark';
            Get.changeThemeMode(ThemeMode.dark);
          },
          activeColor: Colors.green,
        ),
      ),
      ListTile(
        title: Text("AUTO"),
        leading: Radio(
          value: 'system',
          groupValue: val,
          onChanged: (value) {
            screenTheme.value = 'system';
            Get.changeThemeMode(ThemeMode.system);
          },
          activeColor: Colors.green,
        ),
      ),
    ],
  );
}
