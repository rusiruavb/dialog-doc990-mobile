import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class HomeScreenServiceContent extends StatefulWidget {
  final Widget child;

  const HomeScreenServiceContent({
    this.child,
  });

  @override
  _HomeScreenServiceContentState createState() =>
      _HomeScreenServiceContentState(child: child);
}

class _HomeScreenServiceContentState extends State<HomeScreenServiceContent> {
  final Widget child;

  @override
  void initialState() {
    super.initState();
  }

  _HomeScreenServiceContentState({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.homeScreenContentKey,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            child: Text(
              'Avaialble Services',
              style: TextStyle(
                fontFamily: 'Larsseit',
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            padding: EdgeInsets.only(left: 20),
          ),
        ),
        Container(
          child: Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ServiceCard(
                  image: 'assets/images/search_doctor.png',
                  title: 'Channel Doctor',
                  route: '/channel-doctor',
                ),
                ServiceCard(
                  image: 'assets/images/user_channelling.png',
                  title: 'My Channels',
                  route: '/',
                ),
                ServiceCard(
                  image: 'assets/images/medicine.png',
                  title: 'My Medicines',
                  route: '/',
                ),
                ServiceCard(
                  image: 'assets/images/money_refund.png',
                  title: 'Refunds',
                  route: '/',
                ),
              ],
            ),
          ),
        ),
        child
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String image;
  final String route;

  const ServiceCard({
    Key key,
    this.title,
    this.image,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        child: InkWell(
          onTap: () => {
            Navigator.pushNamed(context, route),
          },
          child: Container(
            child: Stack(
              children: <Widget>[
                Align(
                  child: Image.asset(
                    'assets/images/service_background.png',
                    scale: 0.65,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  child: Container(
                    width: 110.0,
                    height: 110.0,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  child: Padding(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Larsseit',
                        fontSize: 16,
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.30),
                  spreadRadius: 0,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
