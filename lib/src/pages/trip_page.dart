import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_challenge_week_three/src/models/trip_model.dart';
import 'package:ui_challenge_week_three/src/widgets/personalized_card.dart';


class TripPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: _List(),
        ) 
      )
   );
  }

}


class _List extends StatefulWidget {
  @override
  __ListState createState() => __ListState();
}

class __ListState extends State<_List> {

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double space = 10;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {

      setState(() {
        closeTopContainer = controller.offset > 50;
      });

    });

  }

  @override
  Widget build(BuildContext context) {

    final trips = getTrips();

    final List<Widget> cards = [];

    for(Trip trip in trips) {
      cards.add(
        PersonalizedPage(
          avatarPhotoUrl: trip.avatarPhotoUrl,
          backgroundPhotoUrl: trip.backgroundPhotoUrl,
          day: trip.day,
          trip: trip.trip,
          weatherIcon: trip.weatherIcon,
        )
      );
      cards.add(
        SizedBox()
      );
    }

    return Column(
      children: <Widget>[

        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: closeTopContainer ? 0 : 100,
          child: _title()
        ),

        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {

              if (notification is ScrollUpdateNotification) {
                space = 0;
              } else if (notification is ScrollEndNotification) {
                space = 10;
              }

            },
            child: ListView.builder(
              itemCount: cards.length,
              controller: controller,
              itemBuilder: (BuildContext context, int index) {

                return Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: space, 
                    ),
                    cards[index]
                  ],
                );

              } 
            ),
          ),
        )

      ],
    );


  }

  Widget _title() {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: <Widget>[
          Text(
            'My trips',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
          ),
          Expanded(child: Container()),
          FaIcon(FontAwesomeIcons.alignJustify, size: 30,),
          SizedBox(width: 10,),
          FaIcon(FontAwesomeIcons.globeEurope, color: Colors.grey, size: 30,)
        ],
      ),
    );

  }


  List<Trip> getTrips() {

    return [
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://www.travelanddestinations.com/wp-content/uploads/2019/10/Ban-Gioc-Detian-Waterfalls-Vietnam-1.jpg',
        day: 'Summer 2017 - 14 days',
        trip: 'Thailand',
        weatherIcon: FontAwesomeIcons.sun
      ),
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://media.cntraveler.com/photos/5cedafa8d3381df5e267daf2/master/pass/Lofoten-Islands-_GettyImages-583610815.jpg',
        day: 'Summer 2012 - 19 days',
        trip: 'England',
        weatherIcon: FontAwesomeIcons.sun
      ),
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://hortensetravel.com/wp-content/uploads/2020/01/The-most-beautiful-places-in-italy-Venice-main-canal.jpg',
        day: 'Spring 2018 - 3 days',
        trip: 'Viena',
        weatherIcon: FontAwesomeIcons.sun
      ),
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://i.ytimg.com/vi/OHAWwaYu2H0/maxresdefault.jpg',
        day: 'Spring 2018 - 9 days',
        trip: 'Viena',
        weatherIcon: FontAwesomeIcons.sun
      ),
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://www.planetware.com/wpimages/2020/01/india-in-pictures-beautiful-places-to-photograph-taj-mahal.jpg',
        day: 'Summer 2018 - 6 days',
        trip: 'India',
        weatherIcon: FontAwesomeIcons.sun
      ),
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://mk0travelawayrru2xew.kinstacdn.com/wp-content/uploads/2013/04/cochem-town-germany-698x698.jpg',
        day: 'Summer 2017 - 14 days',
        trip: 'Somewhere',
        weatherIcon: FontAwesomeIcons.cloudRain
      ),
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://drewdalyonline.com/wp-content/uploads/2019/01/berlin-best-cities-to-visit-in-germany-1513158975-1000X561.jpg',
        day: 'Summer 2017 - 14 days',
        trip: 'Somewhere',
        weatherIcon: FontAwesomeIcons.rainbow
      ),
      Trip(
        avatarPhotoUrl: 'https://thumbs.dreamstime.com/b/hombre-avatar-del-friki-104871313.jpg',
        backgroundPhotoUrl: 'https://www.wildfrontierstravel.com/media/cache/responsive/hero-1920/upload/legacy/04/04b8f3ff7aa8539b9bf8d29cf527531b.jpeg?68fd1fc0',
        day: 'Summer 2017 - 14 days',
        trip: 'Somewhere',
        weatherIcon: FontAwesomeIcons.cloud
      ),
    ];

  }

}