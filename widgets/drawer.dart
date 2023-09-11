// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/pages/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../pages/list-data.dart';
// import '../pages/my_profile.dart';

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           DrawerHeader(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Column(children: [
//               Center(
//                 child: Image.asset(
//                   'assets/images/1.jpg',
//                 ),
//               ),
//               const Text("Shopping is easy")
//             ]),
//           ),
//           ListTile(
//             title: const Text(
//               'Profile',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             onTap: () {
//               // Perform action when item 1 is tapped
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ProfileScreen()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text(
//               'List Data',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             onTap: () {
//               // Perform action when item 2 is tapped
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyListView()),
//               );
//             },
//           ),

//           ListTile(
//             title: const Text(
//               'Logout',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             onTap: () {
//               clearPreferences();
//               // Perform action when item 2 is tapped
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//           ), // Add more ListTiles for additional items
//         ],
//       ),
//     );
//   }

//   void clearPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
