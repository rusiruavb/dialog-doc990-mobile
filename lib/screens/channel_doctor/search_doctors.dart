import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:dialog_doc990_mobile/providers/user_provider.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchedDoctors extends StatefulWidget {
  @override
  _SearchDoctorsState createState() => _SearchDoctorsState();
}

class _SearchDoctorsState extends State<SearchedDoctors> {
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'searhcedDoctorScreenKey');
  List<Doctor> doctors;

  @override
  void initState() {
    super.initState();
    if (context.read<SearchDoctorProvider>().doctors.length > 0) {
      doctors = context.read<SearchDoctorProvider>().doctors;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<UserProvider>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: size.width * 0.7,
        child: Drawer(
          elevation: 0.0,
          child: HomeNavigationMenu(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchDoctorItem(
                          name: doctors[index].name,
                          specialization: doctors[index].specialization,
                          appointments: doctors[index].appointments,
                          imageUrl: doctors[index].imageUrl,
                          availableDetails: doctors[index].availableDetails,
                          notes: doctors[index].notes,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.12,
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 0),
                  child: IconButton(
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    icon: provider.profileImage != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: DecorationImage(
                                image: NetworkImage(
                                  provider.profileImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                          )
                        : Icon(
                            Icons.notes,
                            color: Colors.red,
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 50),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Channel Your Doctor',
                          style: TextStyle(
                            fontFamily: 'Larsseit',
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchDoctorItem extends StatefulWidget {
  String name;
  String imageUrl;
  String specialization;
  int appointments;
  List<AvailableDetails> availableDetails;
  List<dynamic> notes;

  SearchDoctorItem({
    this.name,
    this.imageUrl,
    this.specialization,
    this.appointments,
    this.availableDetails,
    this.notes,
  });

  @override
  _SearchDoctorItem createState() => _SearchDoctorItem(
      name: name,
      imageUrl: imageUrl,
      specialization: specialization,
      appointments: appointments,
      availableDetails: availableDetails,
      notes: notes);
}

class _SearchDoctorItem extends State<SearchDoctorItem> {
  String name;
  String imageUrl;
  String specialization;
  int appointments;
  List<AvailableDetails> availableDetails;
  List<dynamic> notes;

  _SearchDoctorItem({
    this.name,
    this.imageUrl,
    this.specialization,
    this.appointments,
    this.availableDetails,
    this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            var doctor = new Doctor(
              name: name,
              imageUrl: imageUrl,
              appointments: appointments,
              availableDetails: availableDetails,
              notes: notes,
              specialization: specialization,
            );
            context.read<SearchDoctorProvider>().setSelectedDoctor(doctor);
            Navigator.pushNamed(context, '/make-appointment');
          },
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageUrl,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        specialization,
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        availableDetails[0].hospitalName,
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        availableDetails[0].dateTime.split('T')[0],
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Active Appointments: ',
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        appointments.toString(),
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
