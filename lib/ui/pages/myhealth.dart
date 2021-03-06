import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;

List title = [];
List images = [];
List link = [];
//Creating a class user to store the data;

class Myhealth extends StatefulWidget {
  @override
  _MyhealthState createState() => _MyhealthState();
}

class _MyhealthState extends State<Myhealth> {
//Applying get request.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: getRequest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CustomScrollView(
                slivers: [
                  // Add the app bar to the CustomScrollView.
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        "assets/health.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CustomCard(
                            title: title[index],
                            link: link[index],
                            index: index,
                            images: images[index]);
                      },
                      childCount: title.length,
                    ),
                  ),
                ],
              ); // Your UI here
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return CircularProgressIndicator();
            }
          }),
    ));
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String link;
  final String images;
  final int index;

  const CustomCard({this.title, this.link, this.index, this.images});

  @override
  Widget build(BuildContext context) {
    ElevatedButton(
      child: const Text('CALCULATE'),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        // set the background color
        primary: Color(0xFFEB1555),
        elevation: 4,
        shadowColor: Colors.grey,
      ),
    );
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (_) => PDFViewerFromUrl(
            url: link,
            name: title,
          ),
        ),
      ),
      child: Card(
        shadowColor: Colors.grey,
        color: Colors.grey[100 * (index % 9)],
        elevation: 8,
        margin: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
        child: new Column(
          children: <Widget>[
            Image.network(images.replaceAll(".pdf", ".jpg")),
            new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text(title, style: new TextStyle(fontSize: 18.0)),
                ))
          ],
        ),
      ),
    );
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key key, this.url, this.name}) : super(key: key);

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromRGBO(125, 129, 134, 1),
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

getRequest() async {
  //replace your restFull API here.
  title = [];
  link = [];
  images = [];
  String url = "http://10.0.2.2/api/pdfs/get-pdfs/en/my-health";
  final response = await http.get(url);
  var responseData = json.decode(response.body);
  var response2 = responseData.toString().split(",");
  for (var i = 0; i < response2.length - 1; i++) {
    var temp = response2[i].split(": ");
    title.add(temp[0].replaceAll("{", ""));
    link.add(temp[1].replaceAll("}", ""));
    images.add(temp[1].replaceAll("}", ""));
  }
}
