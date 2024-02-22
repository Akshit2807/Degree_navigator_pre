import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key); // Added key parameter

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void StartApp() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void initState() {
    StartApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //             "Images/WhatsApp Image 2024-02-18 at 17.04.05_7735f717.jpg"))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "Images/Screenshot_2024-02-11_234531-removebg-preview (1).png",
                height: 275,
                width: 275,
              ),
              Text(
                "NAVIGATE YOUR DEGREE WITH EASE",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 50,
              ),
              SpinKitCubeGrid(
                color: Color(0xff034f8e),
                size: 50.0,
              ),
              SizedBox(
                height: 120,
              ),
              Text(
                "MADE BY TEAM NAVIGATOR",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
