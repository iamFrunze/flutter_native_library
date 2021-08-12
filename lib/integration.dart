import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntegrationSDK extends StatefulWidget {
  const IntegrationSDK({Key key}) : super(key: key);

  @override
  _IntegrationSDKState createState() => _IntegrationSDKState();
}

class _IntegrationSDKState extends State<IntegrationSDK> {
  static const platform = MethodChannel('com.example.string_parser/okAuth');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: RaisedButton(
            onPressed: _getBatteryLevel,
          ),
        ),
      ),
    );
  }

  String _authResult = 'Unknown';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await platform.invokeMethod('okAuth');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _authResult = batteryLevel;
    });
  }
}
