import 'package:corona_app/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoronaApp extends StatefulWidget {

  @override
  _CoronaAppState createState() => _CoronaAppState();
}

class _CoronaAppState extends State<CoronaApp> {

  late Future data;

  @override
  void initState() {
    super.initState();
    data = getData();
    // data.then((value) => {
    //   print(value[0]["name"])
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covid Di Indonesia'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text("Jumlah Kasus Corona di Indonesia",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 18.0,
              ),
              ),
            ),
            createTextFromApi()
          ],
        ),
      ),
    );
  }

  Widget createTextFromApi() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      child: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
              return Text(
                  "Positif: ${snapshot.data[0]["positif"]}\nSembuh: ${snapshot.data[0]["sembuh"]}\n"
                  "Meninggal: ${snapshot.data[0]["meninggal"]}\nDirawat: ${snapshot.data[0]["dirawat"]}\n"
              );
            } else {
              return CircularProgressIndicator();
            }
      }),
    );
  }

  Future getData() async {
    Network network = Network("https://api.kawalcorona.com/indonesia/");
    return network.fetchData();
  }
}
