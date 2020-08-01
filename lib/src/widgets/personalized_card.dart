import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_challenge_week_three/src/models/trip_model.dart';


class PersonalizedPage extends StatelessWidget {

  final String avatarPhotoUrl;
  final String backgroundPhotoUrl;
  final String day;
  final String trip;
  final IconData weatherIcon;

  PersonalizedPage({
    this.avatarPhotoUrl, 
    this.backgroundPhotoUrl, 
    this.day, 
    this.trip, 
    this.weatherIcon
  });



  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25,
            spreadRadius: 2
          )
        ]
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 280,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 280,
                child: _backgroundImage(),
              ),
              Positioned(
                bottom: 50,
                left: 40,
                child: _info()
              ),
              Positioned(
                bottom: 40,
                right: 40,
                child: _avatar()
              )
            ],
          ),
        ),
      ),
    );

  }

  Widget _backgroundImage() {

    return Image(
      fit: BoxFit.cover,
      image: NetworkImage(
        this.backgroundPhotoUrl
      ) 
    );

  }

  Widget _info() {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FaIcon(this.weatherIcon, color: Colors.white, size: 40,),
        SizedBox(height: 20,),
        Text(this.trip, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Text(this.day, style: TextStyle(color: Colors.white, wordSpacing: 10, fontSize: 18),)
      ],
    );

  }

  Widget _avatar() {

    return CircleAvatar(
      radius: 25,
      backgroundImage: NetworkImage(this.avatarPhotoUrl),
    );

  }

}
