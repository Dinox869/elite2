import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:elite2/screenreducer.dart';
import 'package:elite2/view.dart';
class drn extends StatefulWidget
{
  final num;
  drn({Key key,
    this.num
  }): super (key:key);

  @override
  Drn createState()=> Drn();
}
class Drn extends State<drn>
{

  Widget choice()
  {
    if (widget.num == 1)
    {
      //food
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
                return  SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top:35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("BREAKFAST",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,0),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:15),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("LUNCH",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,1),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:15),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Dinner",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,2),
                      ),
                      SizedBox(height: 15)
                    ],
                  ),
                );
            }
          }
      );
    }
    else if(widget.num == 2)
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
                      Padding(
                          padding: EdgeInsets.only(top:15),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("TEA",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],

                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,3),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:15),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("SOFT DRINK",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],

                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,7),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:15),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("BEER",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],

                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,5),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:15),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("WINE",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],

                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,4),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:15),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("WHISKEY",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontFamily: 'SpecialElite-Regular.ttf',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],

                          )
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: buildGrid(snapshot.data.documents,context,6),
                      ),
                      SizedBox(height: 15)
                    ],
                  ),
                );
            }
          }
      );
    }
  }


  //Grid view ...
  List<Widget> buildGrid(List<DocumentSnapshot> documents,BuildContext context,int num)
  {
    List<Widget> _gridview = [];

    for(DocumentSnapshot document in documents){
      if (document.data['ID'] == num){
        _gridview.add(buildGridItem(document,context,num));
      }

    }
    return _gridview;
  }
  //oN TAP FOR GRIDVIEW is here.
  Widget buildGridItem(DocumentSnapshot document,BuildContext context, int num)
  {

    return new GestureDetector(
        child: new Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2.0,
          margin: const EdgeInsets.only(left: 2, right: 2, bottom: 2,top: 2),
          child: new Stack(
            children: <Widget>[
              new Hero(
                tag: document.data['url'],
                child: new FadeInImage(
                  placeholder: new AssetImage("album/hotel.png"),
                  image: new NetworkImage(document.data['url']),
                  fit: BoxFit.fill,
                  height: screenHeight(context,dividedBy: 3.5),
                ),
              ),
              new Align(
                child: new Container(
                  padding: const EdgeInsets.all(3.0),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          document.data['name'],
                          //  "Bird meat",
                          style:new TextStyle(color: Colors.white)
                      ),
                      new Text("\$" +'${
                          document.data['price']
                      // "200"
                      }',
                          style: new TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                          )
                      ),
                    ],
                  ),
                  color: Colors.black.withOpacity(0.7),
                  width: double.infinity,
                ),
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ),
        onTap: ()
        {
          Navigator.push(context,new MaterialPageRoute(builder: (context)=>
              product(
                url: document.data['url'],
                details: document.data['detail'],
                name: document.data['name'],
                price: document.data['price'],
                ID: document.documentID,
              )
          )
          );
        }
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
            choice()
          ],
        ),
      ),
    );
  }

}