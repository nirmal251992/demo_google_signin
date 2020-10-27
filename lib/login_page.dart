import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'first_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'ad_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AdmobReward reward;
  final FirebaseMessaging _messaging = FirebaseMessaging();
@override

void initState() {
  super.initState();
  reward = AdmobReward(adUnitId: AdManager.rewardId);
  reward.load();
  reward = AdmobReward(
      adUnitId: AdManager.rewardId,
      listener: (event, args) {
        if (event == AdmobAdEvent.rewarded) {
          print("User rewarded.......");
        }
      });
  reward.load();

  _messaging.getToken().then((token) {
    print('Token : $token');
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Login Using',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.greenAccent,
                ),
              ),
              SizedBox(height: 20),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen(rew: reward,);
                },
              ),
            );
          }
        });
      },
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}