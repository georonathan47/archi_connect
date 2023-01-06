import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/colors.dart';
import '../../../../core/components/widgetFunctions.dart';

class Profile extends StatefulWidget {
  final String name;

  const Profile({Key? key, required this.name}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final bool showPassword = false;

  // final DatabaseService _db = DatabaseService();
  final imagePicker = ImagePicker();
  File? _image;
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
    return _image;
  }

  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Profile Settings',
        context: context,
        isDashboard: false,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 25,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: <Widget>[
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.5,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 4,
                            color: Colors.amberAccent.withOpacity(0.5),
                            offset: const Offset(0, 15),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: NetworkImage("https://randomuser.me/api/portraits/men/70.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.amber[300],
                          ),
                          color: Colors.black,
                          onPressed: getImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addVertical(30),
              buildTextField("Full Name", widget.name, false, true, nameCon),
              buildTextField("E-mail", "example@gmail.com", false, false, emailCon),
              buildTextField("Password", "*********", true, false, passwordCon),
              buildTextField("Contact", "020 xxx xxxx", false, false, phoneCon),
              addVertical(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        // padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.red[200],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // await _db.updateUserData(
                        //   "",
                        //   "",
                        //   "",
                        //   233,
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: Colors.teal, //!elevatedButton background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "SAVE",
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
  String labelText,
  String placeholder,
  bool isPasswordTextField,
  bool uneditiable,
  TextEditingController controller,
) {
  var showPassword;
  return Padding(
    padding: const EdgeInsets.only(top: 25, left: 35, right: 35, bottom: 10),
    child: TextFormField(
      readOnly: uneditiable ? true : false,
      obscureText: isPasswordTextField ? true : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {
                  showPassword = !showPassword;
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.red[200],
                ),
              )
            : null, //!This makes the icon appear only for the password field
        contentPadding: const EdgeInsets.only(left: 15),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: LABEL_COLOR,
        ),
        labelStyle: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: LABEL_COLOR,
          letterSpacing: .25,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: BLACK54,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: LABEL_COLOR,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
