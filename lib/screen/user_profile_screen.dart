import 'package:flutter/material.dart';
import 'package:food/src/food_theme_data.dart';
import 'package:food/utils/background_widget.dart';
import 'package:rxdart/rxdart.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(
            topCircleColor: Colors.blue.withOpacity(0.6),
            bottomCircleColor: Colors.amber.withOpacity(0.6),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Hero(
              tag: 'Account',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    color: Colors.red[400],
                    elevation: 20.0,
                    shadowColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: StreamBuilder<User>(
                            stream: userSubject.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData == false) {
                                return Text('');
                              } else {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              'https://pbs.twimg.com/profile_images/1026545591755726848/_-JYbld5.jpg',
                                            ),
                                          )),
                                    ),
                                    Text(
                                      snapshot.data.name,
                                      style: FoodThemeData()
                                          .foodItemTextStyle
                                          .copyWith(
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      snapshot.data.emailID,
                                      style: FoodThemeData()
                                          .foodItemTextStyle
                                          .copyWith(
                                            fontSize: 30,
                                          ),
                                    ),
                                    Text(
                                      snapshot.data.phoneNumber,
                                      style: FoodThemeData()
                                          .foodItemTextStyle
                                          .copyWith(
                                            fontSize: 25.0,
                                          ),
                                    ),
                                  ],
                                );
                              }
                            }),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red[400],
                    elevation: 20.0,
                    shadowColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      // width: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30.0,
                          horizontal: 20.0,
                        ),
                        child: StreamBuilder<User>(
                            stream: userSubject.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData == false) {
                                return Text('');
                              } else {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Your Address List',
                                      style: FoodThemeData()
                                          .foodItemTextStyle
                                          .copyWith(
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Text(
                                      snapshot.data.address,
                                      style: FoodThemeData()
                                          .foodItemTextStyle
                                          .copyWith(
                                            fontSize: 25.0,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Text(
                                      snapshot.data.address,
                                      style: FoodThemeData()
                                          .foodItemTextStyle
                                          .copyWith(
                                            fontSize: 25.0,
                                          ),
                                    ),
                                  ],
                                );
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.red[400],
                    elevation: 20.0,
                    shadowColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      height: 100.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 40.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Text(
                            'Edit Profile',
                            style: FoodThemeData().foodItemTextStyle.copyWith(
                                  //color: Colors.white,
                                  fontSize: 25.0,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Card(
                    color: Colors.red[400],
                    elevation: 20.0,
                    shadowColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      height: 100.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_location_rounded,
                            size: 40.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Text(
                            'Edit Address',
                            style: FoodThemeData().foodItemTextStyle.copyWith(
                                  //color: Colors.white,
                                  fontSize: 25.0,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String emailID;
  final String phoneNumber;
  final String address;

  User({
    @required this.name,
    @required this.emailID,
    @required this.phoneNumber,
    @required this.address,
  });

  factory User.fromJson(Map user) => User(
        name: user['name'],
        emailID: user['emailID'],
        phoneNumber: user['phoneNumber'],
        address: user['address'],
      );
}

Map userMap = {
  'name': 'Alex Hunter',
  'emailID': 'alex@gmail.com',
  'phoneNumber': '3319210821',
  'address': '21A, Circle Avenue, Georgia'
};

User fetchUser() {
  return User.fromJson(userMap);
}

var userSubject = BehaviorSubject<User>();

getUser() {
  User user = fetchUser();
  userSubject.sink.add(user);
}
