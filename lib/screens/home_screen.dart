import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/cupertino.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int slectedIndex=0;
  int _currentTab=0;
  // List<IconData> icons=[
  //   FontAwesomeIcons.plane,
  //   FontAwesomeIcons.bed,
  //   FontAwesomeIcons.walking,
  //   FontAwesomeIcons.biking,
  // ];
  Widget buildIcon (int index) {
    return GestureDetector(
      onTap:(){
        setState(() {
          slectedIndex=index;

        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: slectedIndex== index
              ?Theme.of(context).accentColor
          :Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        // child: Icon(
        //   icons[index],
        //   size: 25.0,
        //   color: slectedIndex==index? Theme
        //       .of(context)
        //       .primaryColor
        //   :Color(0xFFB4C1C4),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children:<Widget> [
        Padding(
          padding: EdgeInsets.only(left: 20.0,right: 120.0),
          child: Text('Discover',style: TextStyle(fontSize: 30.0,fontWeight:FontWeight.bold,
          ),),
        ),
            SizedBox(height: 20.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: icons.asMap().entries.map(
            //       (MapEntry map)=> buildIcon(map.key),
            //   ).toList(),

            //   ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            SizedBox(height: 20.0,),
            HotelCarousel(),
      ],
    ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
      onTap: (int value){
          setState(() {
            _currentTab=value;
          });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30.0,
          ),
      title: SizedBox.shrink(),
        ),

      BottomNavigationBarItem(
        icon: Icon(
          Icons.map_sharp,
          size: 30.0,
        ),
        title: SizedBox.shrink(),

        ),

            BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          size: 30.0,
        ),
        title: SizedBox.shrink(),

        ),

        

        // BottomNavigationBarItem(
        //   icon: CircleAvatar(
        //     radius: 15.0,
        //     backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'

        //     ),
        //   ),
        //   title: SizedBox.shrink(),

        // )

      ],
    ),
    );


  }
}
