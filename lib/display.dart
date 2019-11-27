import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:elite2/view.dart';
import 'package:elite2/acc_extra.dart';
import 'package:elite2/drk_food.dart';

class add_Item extends StatefulWidget
{
  final title;
  add_Item({
    Key key, this.title,}): super(key : key);
  @override
  Add_Item createState()=> Add_Item();
}

List<StaggeredTile> _staggeredTile = const <StaggeredTile>[
  const StaggeredTile.count(4,2),
  const StaggeredTile.count(2,2),
  const StaggeredTile.count(2,3),
  const StaggeredTile.count(2,3),
  const StaggeredTile.count(2,2)
];

List<Widget> _tiles = [

];

class Add_Item extends State<add_Item>
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
        title: Text(
          widget.title,
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
                  children: <Widget>[
                    _Example0Tile(Color(0xff65DBB7),Color(0xff85DBA3),"album/acc.png","album/mattress.png","Accomodation",1,context),
                    _Example0Tile(Color(0xff799FEB),Color(0xff55C2EB),"album/food.jpg","album/cutlery.png","Food",2,context),
                    _Example0Tile(Color(0xffE35672),Color(0xffE35672),"album/glass.jpg","album/ginger-tea.png","Drinks",3,context),
                    _Example0Tile(Color(0xff967AEC),Color(0xffB06FEC),"album/world.jpg","album/hotel.png","Home Page",4,context),
                    _Example0Tile(Color(0xffE89C5B),Color(0xffE8A537),"album/m1.jpg","album/pool-party.png","Extra's",5,context)
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

Widget _Example0Tile (Color background,Color cornerground ,  String pic, String texts, String text,int number,BuildContext context)
{
  return new Card(
    color: background,
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
        if(number == 1 )
        {
          //accomodation
          Navigator.push(context,MaterialPageRoute(builder: (context)=>
              acc()
          ));
        }
        else if(number ==2 )
        {
          //food
          Navigator.push(context,MaterialPageRoute(builder: (context)=>
              drn(num: 1)
          ));
        }else if(number == 3)
        {
          //drinks
          Navigator.push(context,MaterialPageRoute(builder: (context)=>
              drn(num: 2)
          ));
        }else if(number == 5)
        {
          //Extras...
          Navigator.push(context,MaterialPageRoute(builder: (context)=>
              acc()
          ));
        }else
        {
          //Home_page..
//          Navigator.push(context,MaterialPageRoute(builder: (context)=>
//
//          ));
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
                    image: AssetImage(pic)
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
                        image: DecorationImage(
                            image: AssetImage(texts),
                            fit: BoxFit.contain
                        )
                    )
                )
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 06,left: 03,right: 03),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,style: TextStyle(
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