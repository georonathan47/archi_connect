import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar({
  String? title,
  BuildContext? context,
  bool? isDashboard,
  String? logo,
}) {
  return AppBar(
    centerTitle: true,
    leading: isDashboard!
        ? null
        : IconButton(
            iconSize: 35,
            onPressed: () {
              Navigator.pop(context!);
            },
            icon: const Icon(Icons.navigate_before),
          ),
    title: Text(
      title!,
      style: GoogleFonts.lato(
        fontSize: 18,
        letterSpacing: .5,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      isDashboard
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(logo!, height: 35),
            )
          : const Padding(padding: EdgeInsets.all(8.0)),
    ],
  );
}

SizedBox addVertical(double height) {
  return SizedBox(height: height);
}

SizedBox addHorizontal(double width) {
  return SizedBox(width: width);
}

Widget buildTextField(
  String labelText,
  String placeholder,
  bool isPasswordTextField,
  bool uneditable,
  TextEditingController controller, {
  bool? isContact,
  bool? isEmail,
  bool showPassword = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 1.5, left: 5, right: 5, bottom: 7.5),
    child: TextFormField(
      readOnly: uneditable ? true : false,
      obscureText: isPasswordTextField ? true : false,
      controller: controller,
      keyboardType: isContact == true ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: isPasswordTextField
            ? const Icon(
                Icons.lock_outline_rounded,
                size: 20,
              )
            : isContact == true
                ? const Icon(
                    Icons.phone_android,
                    size: 20,
                  )
                : isEmail == true
                    ? const Icon(Icons.email_outlined)
                    : const Icon(
                        Icons.person_outline_outlined,
                        size: 20,
                      ),
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
            : null, // * This makes the icon appear only for the password field
        contentPadding: const EdgeInsets.only(left: 15),
        labelText: labelText,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        labelStyle: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: .25,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
