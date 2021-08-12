import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textInit =
      "test://auth#access_token=-s-cH0KCN9PNi2v6RbHrJY-CM-HsG4KBLfsvl3P7MYvpIzu8xcqrFxtATbNwiYR6NAMpF2yDR8sNhYPAOANqF2M7Qda&session_secret_key=7577f83a3e4d9c3ddecc2d8fc1c1f46f&permissions_granted=VALUABLE_ACCESS&expires_in=1800";
  final textInit2 =
      "test://auth#access_token=-s-8h2OkvbGpF3t7QdItKVMCSftrj.vEzaJqgxNDSissjXMhMbKuI4Qf-bsoi0uh-gupnyw7ucFtIwthR8PqiWtBMb3&session_secret_key=3e7d7620b6cd8c958c73363a39cff4e2&permissions_granted=VALUABLE_ACCESS&expires_in=1800";
  var textRes = "";
  var textRes2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(textInit),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                textRes,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                textRes2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  textRes = parse(textInit);
                  textRes2 = parse2(textInit2);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  String parse(textInitl) {
    final access_token = "access_token";
    if (textInit.contains(access_token)) {
      final partOne = "test://auth#access_token=";
      final partTwo = "&session_secret_key";
      final startIndex =
          textInitl.lastIndexOf(access_token) + access_token.length + 1;
      print(startIndex);
      final endIndex = textInitl.indexOf(partTwo);
      print(endIndex);

      return textInitl.substring(startIndex, endIndex);
    } else
      return "error";
  }

  String parse2(textInitl) {
    final access_token = "access_token";
    if (textInit.contains(access_token)) {
      final partOne = "test://auth#access_token=";
      final partTwo = "&session_secret_key";
      final startIndex =
          textInitl.lastIndexOf(access_token) + access_token.length + 1;
      print(startIndex);
      final endIndex = textInitl.indexOf(partTwo);
      print(endIndex);

      return textInitl.substring(startIndex, endIndex);
    } else
      return "error";
  }
}
