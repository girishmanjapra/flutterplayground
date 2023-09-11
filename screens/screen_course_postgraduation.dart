// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/common_style.dart';

import '../widgets/common_widgets.dart';
import 'screen_name.dart';

// ignore: must_be_immutable
class GraduateSelectionScreen extends StatefulWidget {
  GraduateSelectionScreen({super.key});

  @override
  State<GraduateSelectionScreen> createState() =>
      _GraduateSelectionScreenState();
}

class _GraduateSelectionScreenState extends State<GraduateSelectionScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController otpController = TextEditingController();

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  // GlobalKey to identify the form
  bool shouldShowButton = false;

  String selectedValue = '';

  void _handleRadioValueChange(String? value) {
    if (value != null) {
      setState(() {
        selectedValue = value;
      });
    }
  }

  void onTimerEnd() {
    shouldShowButton = true;
  }

  @override
  Widget build(BuildContext context) {
    // var otpviewModel = Provider.of<OtpModel>(context);

    void submitOtp() async {
      // bool loginSuccessful = await otpviewModel.submitOtp();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              NameFormScreen(), // Replace NextPage with the widget of the next page
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData(
        unselectedWidgetColor:
            AppTheme.secondaryColor, // Set the inactive color globally
      ),
      home: Scaffold(
        backgroundColor: AppTheme.appBgColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.mainBlackCo,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Use Navigator.pop() here
            },
          ),
          title: Text(
            "Post Graduation Details",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bg.png'),
                              fit: BoxFit.fill,
                              // You can adjust this property as per your requirement
                            ),
                          ),
                          height: 250,
                        ),
                        Container(
                          height: 500,
                          margin: EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 0, top: 30),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppTheme.mainBlackCo,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, bottom: 20),
                                                child: Text(
                                                  "Please select the Course",
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.normalWhite,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              ListTile(
                                                title: const Text(
                                                  'SS Surgery',
                                                  style: AppTheme
                                                      .styleRadioButtonText,
                                                ),
                                                leading: Transform.scale(
                                                  scale: 2,
                                                  child: Radio<String>(
                                                    value: '1',
                                                    groupValue: selectedValue,
                                                    onChanged:
                                                        _handleRadioValueChange,
                                                    activeColor:
                                                        AppTheme.secondaryColor,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: const Text(
                                                  'Medical PG',
                                                  style: AppTheme
                                                      .styleRadioButtonText,
                                                ),
                                                leading: Transform.scale(
                                                  scale: 2,
                                                  child: Radio<String>(
                                                    value: '2',
                                                    groupValue: selectedValue,
                                                    onChanged:
                                                        _handleRadioValueChange,
                                                    activeColor:
                                                        AppTheme.secondaryColor,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: const Text('SS Medicine',
                                                    style: AppTheme
                                                        .styleRadioButtonText),
                                                leading: Transform.scale(
                                                  scale: 2,
                                                  child: Radio<String>(
                                                    value: '3',
                                                    groupValue: selectedValue,
                                                    onChanged:
                                                        _handleRadioValueChange,
                                                    activeColor:
                                                        AppTheme.secondaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: const ["Brazil", "Tunisia", 'Canada'],
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      // labelText: "Menu mode",
                                      hintText: "country in menu mode",
                                    ),
                                  ),
                                  onChanged: (val) {
                                    print(val);
                                  },
                                  selectedItem: "Brazil",
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: CustomElevatedButton(
                              text: 'Proceed',
                              onPressed: () {
                                if (selectedValue.isNotEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Selected Value'),
                                        content: Text(selectedValue),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content:
                                            Text('Please select an option.'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
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
      ),
    );
  }
}
