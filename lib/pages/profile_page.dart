import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/user.dart';
import 'package:flutter_login_ui/models/user.dart';
import 'package:flutter_login_ui/models/user_profile.dart';
import 'package:flutter_login_ui/pages/widgets/drawer.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';
import 'package:flutter_login_ui/services/auth/api_service.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  //final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    //UserProfile user = userController.userProfile.value;
    //print(user);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ])),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: Stack(
                children: <Widget>[
                  Icon(Icons.notifications),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        drawer: CustomDrawer(),
        body:
            // Obx(() {
            //   if (userController.isLoading.value)
            //     return Center(child: CircularProgressIndicator());
            //   else
            //     //String capFirstName = user!.firstName![0].toUpperCase() + user.firstName!.substring(1);
            //     //String capLastName =  user.lastName![0].toUpperCase() + user.lastName!.substring(1);
            //     return SingleChildScrollView(
            //         child: Stack(
            //       children: [
            //         Container(
            //           height: 100,
            //           child: HeaderWidget(100, false, Icons.house_rounded),
            //         ),
            //         Container(
            //           alignment: Alignment.center,
            //           margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
            //           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //           child: Column(
            //             children: [
            //               Container(
            //                 padding: EdgeInsets.all(10),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(100),
            //                   border: Border.all(width: 5, color: Colors.white),
            //                   color: Colors.white,
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color: Colors.black12,
            //                       blurRadius: 20,
            //                       offset: const Offset(5, 5),
            //                     ),
            //                   ],
            //                 ),
            //                 child: Icon(
            //                   Icons.person,
            //                   size: 80,
            //                   color: Colors.grey.shade300,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Text(
            //                 //'$capFirstName $capLastName',
            //                 '${user.firstName}',
            //                 style: TextStyle(
            //                     fontSize: 22, fontWeight: FontWeight.bold),
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Text(
            //                 '${user.role}',
            //                 style: TextStyle(
            //                     fontSize: 16, fontWeight: FontWeight.bold),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Container(
            //                 padding: EdgeInsets.all(10),
            //                 child: Column(
            //                   children: <Widget>[
            //                     Container(
            //                       padding:
            //                           const EdgeInsets.only(left: 8.0, bottom: 4.0),
            //                       alignment: Alignment.topLeft,
            //                       child: Text(
            //                         "User Information",
            //                         style: TextStyle(
            //                           color: Colors.black87,
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 16,
            //                         ),
            //                         textAlign: TextAlign.left,
            //                       ),
            //                     ),
            //                     Card(
            //                       child: Container(
            //                         alignment: Alignment.topLeft,
            //                         padding: EdgeInsets.all(15),
            //                         child: Column(
            //                           children: <Widget>[
            //                             Column(
            //                               children: <Widget>[
            //                                 ...ListTile.divideTiles(
            //                                   color: Colors.grey,
            //                                   tiles: [
            //                                     ListTile(
            //                                       contentPadding:
            //                                           EdgeInsets.symmetric(
            //                                               horizontal: 12,
            //                                               vertical: 4),
            //                                       leading: Icon(Icons.my_location),
            //                                       title: Text("Location"),
            //                                       subtitle:
            //                                           Text("Ethiopia, Addis Ababa"),
            //                                     ),
            //                                     ListTile(
            //                                       leading: Icon(Icons.email),
            //                                       title: Text("Email"),
            //                                       subtitle: Text("${user.email}"),
            //                                     ),
            //                                     ListTile(
            //                                       leading: Icon(Icons.phone),
            //                                       title: Text("Phone"),
            //                                       subtitle: Text("${user.phone}"),
            //                                     ),
            //                                     ListTile(
            //                                       leading: Icon(Icons.person),
            //                                       title: Text("About Me"),
            //                                       subtitle: Text(
            //                                           "This is a about me link and you can kmow about me in this section."),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ],
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         )
            //       ],
            //     ));
            // })
            FutureBuilder(
                future: ApiService.getUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == null) {
                      return Text('no data');
                    } else {
                      User user = snapshot.data;
                      String capFirstName = user.firstName[0].toUpperCase() +
                          user.firstName.substring(1);
                      String capLastName = user.lastName[0].toUpperCase() +
                          user.lastName.substring(1);
                      return SingleChildScrollView(
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              child:
                                  HeaderWidget(100, false, Icons.house_rounded),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 5, color: Colors.white),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 20,
                                          offset: const Offset(5, 5),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      size: 80,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '$capFirstName $capLastName',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${user.role}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 4.0),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "User Information",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Card(
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.all(15),
                                            child: Column(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    ...ListTile.divideTiles(
                                                      color: Colors.grey,
                                                      tiles: [
                                                        ListTile(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          12,
                                                                      vertical:
                                                                          4),
                                                          leading: Icon(Icons
                                                              .my_location),
                                                          title:
                                                              Text("Location"),
                                                          subtitle: Text(
                                                              "Ethiopia, Addis Ababa"),
                                                        ),
                                                        ListTile(
                                                          leading:
                                                              Icon(Icons.email),
                                                          title: Text("Email"),
                                                          subtitle: Text(
                                                              "${user.email}"),
                                                        ),
                                                        ListTile(
                                                          leading:
                                                              Icon(Icons.phone),
                                                          title: Text("Phone"),
                                                          subtitle: Text(
                                                              "${user.phone}"),
                                                        ),
                                                        ListTile(
                                                          leading: Icon(
                                                              Icons.person),
                                                          title:
                                                              Text("About Me"),
                                                          subtitle: Text(
                                                              "This is a about me link and you can kmow about me in this section."),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text('None'); // error
                  } else {
                    return Center(
                        child: CircularProgressIndicator()); // loading
                  }
                }

                // builder: (_, snapshot) {
                //   print(snapshot.data);
                //   if (snapshot.hasData) {
                //     UserProfile user = snapshot.data as UserProfile;
                //     return SingleChildScrollView(
                //       child: Stack(
                //         children: [
                //           Container(
                //             height: 100,
                //             child: HeaderWidget(100, false, Icons.house_rounded),
                //           ),
                //           Container(
                //             alignment: Alignment.center,
                //             margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                //             padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                //             child: Column(
                //               children: [
                //                 Container(
                //                   padding: EdgeInsets.all(10),
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(100),
                //                     border: Border.all(width: 5, color: Colors.white),
                //                     color: Colors.white,
                //                     boxShadow: [
                //                       BoxShadow(
                //                         color: Colors.black12,
                //                         blurRadius: 20,
                //                         offset: const Offset(5, 5),
                //                       ),
                //                     ],
                //                   ),
                //                   child: Icon(
                //                     Icons.person,
                //                     size: 80,
                //                     color: Colors.grey.shade300,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 20,
                //                 ),
                //                 Text(
                //                   '${user.firstName} ${user.lastName}',
                //                   style: TextStyle(
                //                       fontSize: 22, fontWeight: FontWeight.bold),
                //                 ),
                //                 SizedBox(
                //                   height: 20,
                //                 ),
                //                 Text(
                //                   'CEO of Temaribet',
                //                   style: TextStyle(
                //                       fontSize: 16, fontWeight: FontWeight.bold),
                //                 ),
                //                 SizedBox(
                //                   height: 10,
                //                 ),
                //                 Container(
                //                   padding: EdgeInsets.all(10),
                //                   child: Column(
                //                     children: <Widget>[
                //                       Container(
                //                         padding: const EdgeInsets.only(
                //                             left: 8.0, bottom: 4.0),
                //                         alignment: Alignment.topLeft,
                //                         child: Text(
                //                           "User Information",
                //                           style: TextStyle(
                //                             color: Colors.black87,
                //                             fontWeight: FontWeight.w500,
                //                             fontSize: 16,
                //                           ),
                //                           textAlign: TextAlign.left,
                //                         ),
                //                       ),
                //                       Card(
                //                         child: Container(
                //                           alignment: Alignment.topLeft,
                //                           padding: EdgeInsets.all(15),
                //                           child: Column(
                //                             children: <Widget>[
                //                               Column(
                //                                 children: <Widget>[
                //                                   ...ListTile.divideTiles(
                //                                     color: Colors.grey,
                //                                     tiles: [
                //                                       ListTile(
                //                                         contentPadding:
                //                                             EdgeInsets.symmetric(
                //                                                 horizontal: 12,
                //                                                 vertical: 4),
                //                                         leading:
                //                                             Icon(Icons.my_location),
                //                                         title: Text("Location"),
                //                                         subtitle: Text(
                //                                             "Ethiopia, Addis Ababa"),
                //                                       ),
                //                                       ListTile(
                //                                         leading: Icon(Icons.email),
                //                                         title: Text("Email"),
                //                                         subtitle: Text("${user.email}"),
                //                                       ),
                //                                       ListTile(
                //                                         leading: Icon(Icons.phone),
                //                                         title: Text("Phone"),
                //                                         subtitle: Text("${user.phone}"),
                //                                       ),
                //                                       ListTile(
                //                                         leading: Icon(Icons.person),
                //                                         title: Text("About Me"),
                //                                         subtitle: Text(
                //                                             "This is a about me link and you can kmow about me in this section."),
                //                                       ),
                //                                     ],
                //                                   ),
                //                                 ],
                //                               )
                //                             ],
                //                           ),
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     );
                //   } else {
                //     return const Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   }
                // },
                // ),
                ));
    //);
  }
}
