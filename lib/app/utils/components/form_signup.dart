import 'package:flutter/material.dart';

class SignUpForm2 extends StatelessWidget {
  final String labelText;
  final onFinished;
  final onChanged;
  final onSubmit;
  final String Function() errorText;
  final currentFocus;
  final nextFocus;
  final keyboardType;
  final Color primaryColor;
  final Color secondaryColor;
  final double widthSize;
  final double heightSize;
  final Function() changeVisibility;
  final bool obscureText;

  const SignUpForm2({
    Key key,
    this.labelText,
    this.onFinished,
    this.onChanged,
    this.onSubmit,
    this.errorText,
    this.currentFocus,
    this.nextFocus,
    this.keyboardType,
    this.primaryColor,
    this.secondaryColor,
    this.widthSize,
    this.heightSize,
    this.obscureText = true,
    this.changeVisibility,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 5),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: widthSize * 0.8,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextFormField(
                obscureText: keyboardType == TextInputType.visiblePassword
                    ? obscureText
                    : false,
                keyboardType: keyboardType,
                focusNode: currentFocus,
                textInputAction: TextInputAction.next,
//      validator: keyboardType == TextInputType.visiblePassword ? (_) => controller.checkPassEmpty() : (_) => controller.checkEmailEmpty(),
                onFieldSubmitted: (_) {
                  if (nextFocus != null) {
                    _fieldFocusChange(context, currentFocus, nextFocus);
                  } else {
                    onSubmit();
                  }
                },
                onChanged: onChanged,
                cursorColor: primaryColor,
                style: TextStyle(
                  color: primaryColor,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryColor,
                    contentPadding: EdgeInsets.all(12.0),
//        prefixIcon: keyboardType == TextInputType.emailAddress ? Icon(Icons.alternate_email) : Icon(Icons.lock_outline),
                    suffixIcon: keyboardType == TextInputType.visiblePassword
                        ? IconButton(
                            icon: obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: changeVisibility,
                          )
                        : null,
                    labelText: labelText,
                    labelStyle: TextStyle(color: primaryColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    errorText: errorText != null ? errorText() : null,
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 0.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    errorStyle: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
