import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite2/screenreducer.dart';

class m_receipts extends StatefulWidget
{
  @override
  M_receipts createState()=> M_receipts();
}

class M_receipts extends State<m_receipts>
{

  TextEditingController search;
  Widget _Stream(){
    return new StreamBuilder<QuerySnapshot>(
        stream:
        Firestore.instance.collection("receipts_for_Mpesa").where('Hotelname', isEqualTo: 'Freg Hotel').snapshots(),
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
    return _list;
  }
  String n;
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
            Text("Freg Hotel",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Date:"
                          ,style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        //find the exact number...
                        finder(document.data['time'])
                      ],
                    )
                  ],
                ),
                Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Time:"
                            ,style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Am 2:30"
                            ,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            ),
                          )
                        ],
                      )
                    ]
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  finder( int timez){
//    if( timez.toString().substring(4,5) == '09')
    {
      return Text("SEP "+timez.toString() ,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );
    }
    //else
        {
      return Text("OCT 07",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );

    }
  }

//Item list generation...
  List<Widget> buildLists(DocumentSnapshot document, BuildContext context, int num) {
    List<Widget> _list = [];
    _list.clear();
    List<String> price = List.from(document['price']);
    List<String> Qty = List.from(document['Qty']);
    List<String> Item = List.from(document['Item']);

    for(String Price in price)
    {
      for(String qty in Qty)
      {
        for(String document in Item)
        {
          if (_list.length <= Item.length - 1)
          {
            _list.add(buildItem(document,qty,Price,context,num));
          }
          else
          {
            print("Error occurring in silence");
          }
        }
      }
    }
    return _list;
  }
//Item generation..
  Widget buildItem(String Item,String Qty,String Price,BuildContext context,int num)
  {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xff25242A),
              child: Padding(
                padding: EdgeInsets.only(top: 29, bottom: 10),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          dispose();
                          Navigator.pop(context);
                        }),
                    SizedBox(width: 20),
                    Flexible(
                      child: TextField(
                        autofocus: false,
                        cursorColor: Colors.white,
                        controller: search,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                            hintText: "  Search here!",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 01, vertical: 10),
                            suffixIcon: Material(
                              elevation: 4.0,
                              color: Color(0xfff7f7f7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),),
                              child: IconButton(
                                  icon: new Icon(Icons.search),
                                  color: Colors.black,
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
//                                      Navigator.push(context, MaterialPageRoute(
//                                          builder: (context) =>
////                                              Results(
////                                                string: search.text.toString(),)
//                                      ));
//                                            widget.string = search.text.toString();
//                                            print("======rer======");
                                    });
                                  }
                              ),
                            ),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),
            ),
            _Stream()
          ],
        ),
      ),
    );
  }
}