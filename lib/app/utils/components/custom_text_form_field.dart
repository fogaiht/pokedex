import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
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

  const CustomTextFormField({
    Key key,
    this.labelText,
    this.onFinished,
    this.onChanged,
    this.errorText,
    this.currentFocus,
    this.nextFocus,
    this.keyboardType,
    @required this.primaryColor,
    @required this.secondaryColor,
    this.widthSize,
    this.heightSize,
    this.onSubmit,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText;
  FocusNode currentNode;

  @override
  void initState() {
    obscureText = true;
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 5),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: widget.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: widget.widthSize * 0.8,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextFormField(
                obscureText:
                    widget.keyboardType == TextInputType.visiblePassword
                        ? obscureText
                        : false,
                keyboardType: widget.keyboardType,
                focusNode: widget.currentFocus,
                textInputAction: TextInputAction.next,
//      validator: keyboardType == TextInputType.visiblePassword ? (_) => controller.checkPassEmpty() : (_) => controller.checkEmailEmpty(),
                onFieldSubmitted: (_) {
                  if (widget.nextFocus != null) {
                    _fieldFocusChange(context, widget.currentFocus, widget.nextFocus);
                  } else {
                    widget.onSubmit();
                  }
                },
                onChanged: widget.onChanged,
                cursorColor: widget.primaryColor,
                style: TextStyle(
                  color: widget.primaryColor,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: widget.secondaryColor,
                    contentPadding: EdgeInsets.all(12.0),
//        prefixIcon: keyboardType == TextInputType.emailAddress ? Icon(Icons.alternate_email) : Icon(Icons.lock_outline),
                    suffixIcon:
                        widget.keyboardType == TextInputType.visiblePassword
                            ? IconButton(
                                icon: obscureText
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              )
                            : null,
                    labelText: widget.labelText,
                    labelStyle: TextStyle(color: widget.primaryColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.primaryColor),
                    ),
                    errorText:
                        widget.errorText != null ? widget.errorText() : null,
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

_fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
}