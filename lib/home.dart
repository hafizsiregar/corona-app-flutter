import 'package:corona_app/corona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/covid.jpg'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Text('Covid 19',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text('Jelajahi kasus covid di Indonesia'),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return CoronaApp();
                    }));
                  }),
              ),
        ],
        ),
      ),
    );
  }
}
