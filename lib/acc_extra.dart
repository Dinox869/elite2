import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite2/screenreducer.dart';

class acc extends StatefulWidget
{
  @override
  Acc createState ()=> Acc();
}
class Acc extends State<acc>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            choice()
          ],
        ),
      ),
    );

  }
}
Widget choice()
{
  return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("Freg leaves hotel").snapshots(),
      builder : (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot)
      {
        if(snapshot.hasError)
          return new Text('${snapshot.error}');
        switch(snapshot.connectionState)
        {
          case ConnectionState.waiting:
          //change to a hovering page waiting for the actual data...
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height:screenHeight(context,dividedBy: 1),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            );
          default:
            return  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ListView(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      primary: false,
                      shrinkWrap: true,
                      children: buildList(snapshot.data.documents, context,8),
                    )
                  ]
              ),
            );
        }
      }
  );
}
// Listview generation...
List<Widget> buildList(List<DocumentSnapshot> documents, BuildContext context, int num) {
  List<Widget> _list = [];
  for(DocumentSnapshot document in documents)
  {
    if (document.data['ID'] == num )
    {
      _list.add(buildListitems(document,context,num));
    }

  }
  return _list;
}
//Listview generation...
Widget buildListitems(DocumentSnapshot document, BuildContext context,int num)
{
  return GestureDetector
    (

    onTap: (){
//      if(num ==8)
//      {
//        Navigator.push(context,MaterialPageRoute(builder: (context)=>
//            check(
//              price: document.data['price'],
//              name: document.data['name'],
//              detail: document.data['detail'],
//              url: document.data['url'],
//            )
//        ));
//      }
//      else
//      {
//        Navigator.push(context,MaterialPageRoute(builder: (context)=>
//            product(
//              price: document.data['price'],
//              name: document.data['name'],
//              details: document.data['detail'],
//              url: document.data['url'],
//            )
//        ));
//      }
    },
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: EdgeInsets.only(top:05 , bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: FadeInImage
              (
              placeholder: new AssetImage("albums/bed.jpg"),
              image: NetworkImage(document.data['url']),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(document.data['name'],
                  style: TextStyle(
                      color: Colors.cyan[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
//                SmoothStarRating(
//                  allowHalfRating: false,
//                  starCount: 5,
//                  rating: 4,
//                  size: 20,
//                  color: Colors.cyan[800],
//                  spacing: 0.0,
//                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 05,right: 05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    Text(document.data['price'],
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
                Text(document.data['rating'],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ],
      ),
    ),
  );
}