import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final Decoration _screendec = BoxDecoration(
      border: Border.all(width: 4, color: Colors.green),
      image: DecorationImage(
          image: NetworkImage(
              'https://www.themebeta.com/media/cache/400x225/files/windows/images/201808/30/8e6cac645e8b873786b053dc845c2abe.jpeg'),
          fit: BoxFit.cover));
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: _screendec,
          child: Column(
            children: [
              logocontainer(),
              SizedBox(height: 5.h),
              Form(
                key: _formkey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  height: 50.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.3)),
                  child: Column(
                    children: [
                      usernamefield(),
                      SizedBox(
                        height: 1,
                      ),
                      passwordfield(),
                      SizedBox(height: 1, width: 1),
                      showpasswordfield(),
                      loginbutton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          forgotpasswordbutton(),
                          Text(
                            'dont have an account?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      registerbutton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton registerbutton() {
    return ElevatedButton(
      child: Text(
        'REGISTER NOW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          fixedSize: Size(40.w, 4.h),
          primary: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  TextButton forgotpasswordbutton() {
    return TextButton(
      child: Text(
        'FORGOT PASSWORD',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
    );
  }

  ElevatedButton loginbutton() {
    return ElevatedButton(
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      onPressed: () => onLoginPressed(context),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(40.w, 4.h),
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  void onLoginPressed(BuildContext Context) {
    if (_formkey.currentState!.validate()) {
      print('hi');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'LOGIN IS SUCCESSFULL',
            style: TextStyle(
                color: Colors.pink, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 1),
          action: SnackBarAction(label: 'OK', onPressed: () {}),
        ),
      );
    }
  }

  Row showpasswordfield() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: checkboxvalue,
            hoverColor: Colors.pink,
            focusColor: Colors.pink,
            fillColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.pink;
              }
              return Colors.white;
            }),
            onChanged: (value) {
              setState(() {
                checkboxvalue = value!;
              });
            }),
        Text(
          'show password',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.pink),
        )
      ],
    );
  }

  Container passwordfield() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      height: 8.h,
      width: 80.w,
      child: TextFormField(
        controller: password,
        obscureText: !checkboxvalue,
        validator: (value) {
          if (value!.isEmpty) {
            return 'please enter the password';
          } else if (value.length >= 10) {
            return 'name too long';
          } else if (value.length <= 5) {
            return 'name too short';
          }
          return null;
        },
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.white,
              size: 25.sp,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(10.sp)),
            hintText: 'PASSWORD',
            hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Container usernamefield() {
    return Container(
      height: 8.h,
      width: 80.w,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: TextFormField(
        controller: username,
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter your username';
          } else if (value.length >= 10) {
            return 'Name too long';
          } else if (value.length <= 5) {
            return 'Name too short';
          }
          return null;
        },
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          icon: Icon(
            Icons.person_rounded,
            size: 25.sp,
            color: Colors.white,
          ),
          hintText: 'ENTER USERNAME',
          hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Container logocontainer() {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 17.h,
              width: 50.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://render.fineartamerica.com/images/rendered/medium/print/8/5.5/break/images/artworkimages/medium/2/1-crystal-cave-bragi-kort.jpg'),
                      fit: BoxFit.cover)),
            ),
          ],
        )
      ],
    ));
  }
}
