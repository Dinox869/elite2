import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:elite2/screenreducer.dart';

class graph extends StatefulWidget
{
  @override
  Graph createState() => Graph();
}

class Graph extends State<graph>
{

//   Calcget(List<DocumentSnapshot>  documents)
//  {
//    for(DocumentSnapshot document in documents )
//    {
//      Total_Price = Total_Price + int.parse(document.data['price']);
//    }
//return Total_Price;
//  }
  StreamSubscription<DocumentSnapshot> subscriptions;
  String  map;
  int  cards;
  List returnItems = [];

  void  initState()
  {
    DocumentReference documentReferences = Firestore.instance.collection("receipts_for_Mpesa").document();
    subscriptions = documentReferences .snapshots().listen((datasnapshot) {
      if(datasnapshot.data['Hotelname'].toString() == "Freg Hotel")
      {


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        centerTitle: true,
        backgroundColor:Color(0xff25242A),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Container(
            child: Column(
              children: <Widget>[
                Cards(context)
              ],
            ),
          )
      ),
    );


  }

  Cards(BuildContext context)
  {
    return  Column(
        children: <Widget>[
          Text("Todays Clients.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
          ),
          Divider(),
          info(context),
          Text("Summary",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
          ),
          Divider(),
          finals(context)
        ],
      );

  }

  finals(BuildContext context)
  {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.only(top: 05, bottom: 10),
        child: Column(
          children: <Widget>[
            Text("Total number of clients: "+ cards.toString() ,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
            ),
            Divider(),
            Text(" Commodities bought :"),
            
          ],
        )
    );
  }




  info(BuildContext context)
  {
    return new StreamBuilder<QuerySnapshot>(
        stream:
        Firestore.instance.collection("receipts_for_Mpesa").where('Hotelname',isEqualTo: 'Freg Hotel').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot>snapshot) {
          if (snapshot.hasError)
          {
            return Center(
                child:Text("Error occured..")
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Column(
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
              return ListView(
                padding: EdgeInsets.only(left: 15, right: 15),
                primary: false,
                shrinkWrap: true,
                children: buildList(snapshot.data.documents, context),
              );
          }
        }
    );

  }
  List<Widget> buildList(List<DocumentSnapshot> documents, BuildContext context) {
    List<Widget> _list = [];
    for(DocumentSnapshot document in documents)
    {
      _list.add(buildListitems(document,context));
    }
    cards = _list.length;
    return _list;
  }
  Widget buildListitems(DocumentSnapshot document, BuildContext context) {
    return GestureDetector
      (
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.only(top: 05, bottom: 10),
        child: Column(
          children: <Widget>[
            Text(document.data['username'],
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Transaction.",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(document.data['transaction'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Receipt number.",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(document.data['Serial no.'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                        children: <Widget>
                        [
                          Text("Amount",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11
                            ),
                          )
                        ]
                    ),
                    Row(
                      children: <Widget>[
                        Text(document.data['Amount'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.green
                          ),)
                      ],
                    )
                  ],
                )
              ],
            ),
            Divider(),
            ListView(
              padding: EdgeInsets.only(left: 15, right: 15),
              primary: false,
              shrinkWrap: true,
              children: buildLists(document, context,8),
            ),
            Divider(),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Column(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Text("Date:"
//                          ,style: TextStyle(
//                              color: Colors.grey,
//                              fontSize: 11
//                          ),
//                        )
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        //find the exact number...
//                      //  finder(document.data['time'])
//                      ],
//                    )
//                  ],
//                ),
//                Column(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Text("Time:"
//                            ,style: TextStyle(
//                                color: Colors.grey,
//                                fontSize: 11
//                            ),
//                          ),
//                        ],
//                      ),
//                      Row(
//                        children: <Widget>[
//                          Text("Am 2:30"
//                            ,style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                fontSize: 13
//                            ),
//                          )
//                        ],
//                      )
//                    ]
//                )
//              ],
//            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildLists(DocumentSnapshot document, BuildContext context, int num) {
    List<Widget> _lists = [];
    _lists.clear();
    List<String> price = List.from(document['price']);
    List<String> Qty = List.from(document['Qty']);
    List<String> Item = List.from(document['Item']);

    for(String Price in price)
    {
      for(String qty in Qty)
      {
        for(String document in Item)
        {
          if (_lists.length <= Item.length - 1)
          {
            _lists.add(buildItem(document,qty,Price,context,num));
          }
          else
          {
            print("Error occurring in silence");
          }
        }
      }
    }
    return _lists;
  }
//Item generation..
  Widget buildItem(String Item,String Qty,String Price,BuildContext context,int num)
  {
    returnItems.add(Item);
    return ListTile(
        leading: Text(Item,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold
          ),
        ),
        trailing: Text(Qty +" * "+Price,
          style: TextStyle(
              fontSize: 10,
              color: Colors.grey
          ),
        )
    );
  }

}