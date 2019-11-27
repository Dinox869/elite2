import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:elite2/display.dart';
import 'package:elite2/M_receipt.dart';
import 'package:elite2/orders.dart';
import 'package:elite2/graph.dart';
import 'package:elite2/accomodation.dart';

class home extends StatefulWidget
{
  @override
  HOME  createState()=> HOME();
}
List<StaggeredTile> _staggeredTile = const <StaggeredTile>[

  const StaggeredTile.count(4,2),
  const StaggeredTile.count(2,2),
  const StaggeredTile.count(2,3),
  const StaggeredTile.count(2,3),
  const StaggeredTile.count(2,2)
];
//
//List<Widget> _tiles = [
//  _Example0Tile(Color(0xff65DBB7),"album/bill.png","Mpesa Receipts",1),
//  _Example0Tile(Color(0xff799FEB),"album/stories.png","Add Item",2),
//  _Example0Tile(Color(0xffE35672),"album/shuffle.png","Change Item",3),
//  _Example0Tile(Color(0xff967AEC),"album/stock-market.png","Statistics",4),
//  _Example0Tile(Color(0xffE89C5B),"album/mattress.png","Accomodation status",5)
//];


class HOME extends State<home>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(0xff25242A) ,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add_alert,color: Colors.white,), onPressed: (){
          })
        ],
        centerTitle: true,
        title: Text("Freg Hotel",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //color: Color(0xff25242A),
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xff25242A),
              child: Padding(padding: const EdgeInsets.only(bottom: 02,top: 04,left: 02,right: 02),
                child: new StaggeredGridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  primary: false,
                  staggeredTiles: _staggeredTile,
                  children: <Widget>
                  [
                    _Example0Tile(Color(0xffD14D95),Color(0xffE7866E),"album/cons.jpg","album/bill.png","Mpesa Receipts",1,context),
                    _Example0Tile(Color(0xffA843AE),Color(0xffC3438A),"album/add.jpg","album/stories.png","Items",2,context),
                    _Example0Tile(Color(0xff9C3EAE),Color(0xffE26796),"album/food.jpg","album/shuffle.png","Orders",3,context),
                    _Example0Tile(Color(0xff6768CE),Color(0xffA85BCE),"album/istock-494497554_goir_gross.jpg","album/stock-market.png","Statistics",4,context),
                    _Example0Tile(Color(0xff627AD3),Color(0xffAF52C5),"album/hype.jpg","album/mattress.png","Accomodation status",5,context)
                  ],
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  padding: const EdgeInsets.all(4.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _Example0Tile (Color background, Color cornerground, String texts,String ionc, String text,int number,BuildContext context)
{
  return new Card(
    //color: background,
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2.0,
    child: new InkWell(
      onTap: ()
      {
        //next navigation
        if(number == 2)
        {
          String adds = "Add Item";
          print("Button works,check the context...");
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              add_Item(title: adds)
          ));
        }
        else if (number == 4)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              graph()
          ));
        }
        else if (number == 3)
        {
          String adds = "Change Item";
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              orders()
          ));
        }
        else if (number == 1)
        {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              m_receipts()
          ));
        }
        else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              accmo()
          ));
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            //height: 30,
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(texts)
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin:  FractionalOffset.center,
                    end: FractionalOffset.topLeft,
                    colors: [
                      background.withOpacity(0.7),
                      cornerground
                    ],
                    stops: [
                      0.0,
                      1.0
                    ]
                )
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 03,left: 03,right: 03),
            child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(ionc),
                            fit: BoxFit.contain
                        )
                    )
                )
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 06,left: 03,right: 03),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(text,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),),
            ),
          )
        ],
      ),
    ),
  );
}