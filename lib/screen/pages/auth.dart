import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_screen_lock/lock_screen.dart';
import 'package:minivines/screen/home_screen.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Go to another page after unlocked biometrics'),
                      onPressed: () => showLockScreen(
                        context: context,
                        correctString: '1234',
                        canBiometric: true,
                        showBiometricFirst: true,
                        biometricAuthenticate: (context) async {
                          final localAuth = LocalAuthentication();
                          final didAuthenticate =
                          await localAuth.authenticateWithBiometrics(
                              localizedReason: 'Please authenticate');
                          if (didAuthenticate) {
                            return true;
                          }

                          return false;
                        },
                        onUnlocked: () {
                          print('Unlocked.');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ),
                    RaisedButton(onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    })
                  ])),
        ));
  }
}
