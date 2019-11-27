import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class accmo extends StatefulWidget
{
  @override
  Accomo createState() => Accomo();
}

class Accomo extends State<accmo>
{
  int _itemCount = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff25242A),
          title: Text("Accomodation status",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
              child:Padding(
                padding: EdgeInsets.only(top: 100.0,bottom: 220,right: 50, left: 50),
                child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2.0,
                    child:Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text("Available Rooms:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(_itemCount.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 50
                          ),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.add,size: 50,color: Colors.green,),
                                onPressed: ()
                                {
                                  if (_itemCount!=23)
                                  {
                                    setState(() {
                                      _itemCount = _itemCount + 1;
                                    });
                                  }
                                }),
                            IconButton(icon: Icon(Icons.remove,size: 50,color: Colors.redAccent),
                                onPressed: ()
                                {
                                  if (_itemCount!=0)
                                  {
                                    setState(() {
                                      _itemCount = _itemCount- 1;
                                    });
                                  }
                                }),

                          ],
                        )
                      ],
                    )
                ),
              )
          ),
        )


    );
  }

}