import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final Decoration _screendec = BoxDecoration(
      border: Border.all(width: 1.w, color: Colors.blue),
      image: const DecorationImage(
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
              SizedBox(
                height: 5.h,
              ),
              logocontainer(),
              SizedBox(height: 5.h),
              Form(
                key: _formkey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                        height: 1.h,
                      ),
                      passwordfield(),
                      showpasswordfield(),
                      loginbutton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          forgotpasswordbutton(),
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
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
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          fixedSize: Size(40.w, 5.h),
          primary: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  TextButton forgotpasswordbutton() {
    return TextButton(
      child: Text(
        'Forgot Password',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 13.sp,
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
          fontSize: 15.sp,
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'LOGIN IS SUCCESSFULL',
            style: TextStyle(
                color: Colors.pink,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
          duration: const Duration(seconds: 1),
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
          'Show Password',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.pink),
        )
      ],
    );
  }

  Container passwordfield() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 5),
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
            color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.white,
              size: 25.sp,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                borderRadius: BorderRadius.circular(5.sp)),
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
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 5),
      child: TextFormField(
        controller: username,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter your username';
          } else if (value.length >= 10) {
            return 'Name too long';
          } else if (value.length <= 5) {
            return 'Name too short';
          }
          return null;
        },
        style: TextStyle(
            color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
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
              borderSide: BorderSide(color: Colors.white, width: 2.sp),
              borderRadius: BorderRadius.circular(
                5.sp,
              )),
        ),
      ),
    );
  }

  Container logocontainer() {
    return Container(
      height: 17.h,
      width: 50.w,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.sp,
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(5.sp),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://render.fineartamerica.com/images/rendered/medium/print/8/5.5/break/images/artworkimages/medium/2/1-crystal-cave-bragi-kort.jpg'),
              fit: BoxFit.cover)),
    );
  }
}
