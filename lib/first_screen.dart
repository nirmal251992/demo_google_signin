import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'ad_manager.dart';

class FirstScreen extends StatefulWidget {
  AdmobReward rew;
  FirstScreen ({ Key key, this.rew }): super(key: key);
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> {

  @override
  void initState() {
    super.initState();
    widget.rew.show();

    // Future.delayed(Duration(seconds: 5), () async {
    //   if (await reward.isLoaded) {
    //     reward.show();
    //     }
    //   });

      // _showadd();
  }

// void show() async {
//     setState(() {
//       reward.show();
//     });

  // _showadd() async {
  //     if (await reward.isLoaded) {
  //       reward.show();
  //     }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Google SignIn Demo'),
        centerTitle:true ,
      ),
      body: Center(
        child: Container(
          //padding: EdgeInsets.all(0.0),
          // color: Colors.white,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [Colors.blue[100], Colors.blue[400]],
          //   ),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // RaisedButton(
              //   onPressed: () async {
              //     if (await reward.isLoaded) {
              //       reward.show();
              //     }
              //   },
              //   child: Text("Show Video Ad"),
              // ),
              // CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     imageUrl,
              //   ),
              //   radius: 60,
              //   backgroundColor: Colors.transparent,
              // ),
              SizedBox(height: 40),

              Text(
               'Name : $name',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.greenAccent,
                ),
              ),
              SizedBox(height: 20),

              Text(
                'Email : $email',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.greenAccent,
                ),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                },
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(40)),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      if (index % 6 == 0 && index != 0) {
                        return AdmobBanner(
                            adUnitId: AdManager.bannerId,
                            adSize: AdmobBannerSize.BANNER);
                      }
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
