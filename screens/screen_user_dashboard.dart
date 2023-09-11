// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import './../models/user.dart';
import './../viewmodels/login_viewmodel.dart';
import '../widgets/common_style.dart';
import '../widgets/common_widgets.dart';

class UserDashboard extends StatefulWidget {
  UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  final TextEditingController _emailController = TextEditingController();
  int _selectedIndex = 0;
  // GlobalKey to identify the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var loginViewModel = Provider.of<LoginViewModel>(context);

    // ignore: no_leading_underscores_for_local_identifiers
    void _login() async {
      // Check if the form is valid before proceeding
      if (_formKey.currentState?.validate() ?? false) {
        String phone = _emailController.text.trim();
        User user = User(phone: phone);
        int loginSuccessful = await loginViewModel.loginUser(user);

        if (loginSuccessful == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDashboard(),
            ),
          );
        } else {
          // Show the SnackBar using ScaffoldMessenger within the else part.
          Fluttertoast.showToast(
            msg: 'Login Failed',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            textColor: const Color.fromARGB(255, 0, 0, 0),
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDashboard(),
            ),
          );
        }
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _onClickableTextTap() {
      // ignore: avoid_print
      print("Clickable text tapped!"); // You can perform your action here.
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppTheme.blackColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.mainBlackCo,
          elevation: 0,
          leading: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                print('Avatar tapped');
              },
              child: CircleAvatar(
                radius: 0, // Set the desired radius to control the size
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fHww&w=1000&q=80',
                ),
              ),
            ),
          ),
          title: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {
                // Add your icon's action here
                print('Settings icon pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add your icon's action here
                print('Settings icon pressed');
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg.png'),
                          fit: BoxFit
                              .cover, // You can adjust this property as per your requirement
                        ),
                      ),
                      // color: Color.fromARGB(99, 0, 0, 0),
                      height: 340,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              MainHeadding(
                                  mainHead: "Hi Maalty",
                                  subHead:
                                      "Let us help you to learn more efficiently"),
                              SizedBox(
                                child: Container(
                                  color: AppTheme.mainBlackCo,
                                  height: 140,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: CardLeft(
                                            mainHead: "Start Plan your studies",
                                            subHead:
                                                "Let us help you to learn more efficiently",
                                            onPressed: () {
                                              print("samples");
                                            },
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Stack(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/Group002.png"),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 30, left: 20),
                                                    child: Image.asset(
                                                        "assets/images/globe1.png"),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Container(
                                  color: AppTheme.mainBlackCo,
                                  height: 152,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/images/books.png"),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 30),
                                              child: Text(
                                                "Live Now",
                                                style: TextStyle(
                                                    color: Color(0xFFED813F),
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Mock Test",
                                                    style: const TextStyle(
                                                        fontSize: 30,
                                                        fontFamily: 'Recoleta',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        letterSpacing: 2),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: SvgPicture.asset(
                                                      "assets/images/scribbles-scribbles.svg"),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                child: Container(
                                  color: AppTheme.mainBlackCo,
                                  height: 152,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Text(
                                                "Live Now",
                                                style: TextStyle(
                                                    color: Color(0xFFED813F),
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10,
                                                      bottom: 15,
                                                      top: 10),
                                                  child: Text(
                                                    "Finish English Chapter IV",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        fontFamily: 'Recoleta',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        letterSpacing: 2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            LinearPercentIndicator(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  50,
                                              animation: true,
                                              lineHeight: 25.0,
                                              animationDuration: 2500,
                                              percent: 0.8,
                                              center: Text("80.0%"),
                                              barRadius: Radius.circular(20),
                                              progressColor: Color.fromARGB(
                                                  255, 16, 181, 154),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                child: Container(
                                  color: AppTheme.mainBlackCo,
                                  height: 152,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Text(
                                                "Live Now",
                                                style: TextStyle(
                                                    color: Color(0xFFED813F),
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10,
                                                      bottom: 15,
                                                      top: 10),
                                                  child: Text(
                                                    "Finish Maths Chapter IV",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        fontFamily: 'Recoleta',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        letterSpacing: 2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            LinearPercentIndicator(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  50,
                                              animation: true,
                                              lineHeight: 25.0,
                                              animationDuration: 2500,
                                              percent: 0.53,
                                              center: Text("53.0%"),
                                              barRadius: Radius.circular(20),
                                              progressColor: Color.fromARGB(
                                                  255, 16, 181, 154),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )

                              // Image.asset(
                              //   'assets/images/img-login.png',
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppTheme.mainBlackCo,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lens_blur_outlined),
              label: 'Revice',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.book),
            //   label: 'Quiz',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.grade_outlined),
            //   label: 'Rank',
            // ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppTheme.secondaryColor,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
