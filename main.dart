import 'package:flutter/material.dart';
import 'package:flutter_application_2/viewmodels/otp_viewmodel.dart';
import 'package:flutter_application_2/viewmodels/username_viewmodel.dart';
import 'package:provider/provider.dart';

import './viewmodels/login_viewmodel.dart';
import 'screens/screen_imageupload.dart';
import 'screens/screen_login.dart';
import 'viewmodels/imageupload_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }

  // Add other navigation methods as needed.
}

class MyApp extends StatelessWidget {
  final NavigationService _navigationService = NavigationService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => OtpModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => FileUploadViewModel()),
        Provider.value(
            value:
                _navigationService), // Provide the NavigationService instance
      ],
      child: MaterialApp(
        navigatorKey: _navigationService
            .navigatorKey, // Use the NavigationService's navigatorKey
        title: 'ChangeNotifier Example',
        home: FileUpload(), // Display the splash screen first
        routes: {
          '/home': (context) =>
              LoginFormScreen(), // Navigate to LoginFormScreen after the splash screen
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// import 'pages/initiate.dart';
// import 'pages/list-data.dart';
// import 'pages/my_profile.dart';
// import 'pages/signup_page.dart';
// import 'pages/splash_screen.dart';
// import 'pages/web_view.dart';

// void main() {
//   runApp(const LoginApp());
// }

// class LoginApp extends StatelessWidget {
//   const LoginApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Giride App',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const SplashScreen(),
//         '/signup': (context) => SignUpPage(),
//         '/login': (context) => LoginPage(),
//         '/listView': (context) => const MyListView(),
//         '/myProfile': (context) => const ProfileScreen(),
//         '/shop': (context) => const WebViewExample(),
//       },
//     );
//   }
// }


