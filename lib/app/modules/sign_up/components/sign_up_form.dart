// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import '../../../utils/components/state_button.dart';
// import '../../../utils/form_controller.dart';
// import '../sign_up_controller.dart';

// class SignUpForm extends StatefulWidget {
//   final Color primaryColor;
//   final Color secondaryColor;
//   final String assetLogoPath;
//   final String heroLogoTag;
//   final String fontFamily;
//   final String signUpRoute;
//   final double heightSize;
//   final double widthSize;

//   const SignUpForm(
//       {Key key,
//       this.primaryColor,
//       this.secondaryColor,
//       this.assetLogoPath,
//       this.heroLogoTag,
//       this.fontFamily,
//       this.signUpRoute,
//       this.heightSize,
//       this.widthSize})
//       : super(key: key);
//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   FormController _formController;
//   SignUpController controller;

//   final FocusNode _nameNode = FocusNode();
//   final FocusNode _emailNode = FocusNode();
//   final FocusNode _passwordNode = FocusNode();
//   @override
//   void initState() {
//     controller = Modular.get<SignUpController>();
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     _formController = FormController();
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double widthSize = MediaQuery.of(context).size.width;
//     double heightSize = MediaQuery.of(context).size.height;
//     Color primaryColor = Colors.red;
//     Color secondaryColor = Colors.white;
//     return Container(
//         child: Form(
//       key: _formController.key,
//       child: Container(
//         height: heightSize * 0.6,
//         width: widthSize,
//         decoration: BoxDecoration(
//           color: secondaryColor,
//           border: Border.all(
//             width: 2,
//             color: Colors.black,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(top: 16.0),
//               child: Container(
//                 width: widthSize,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: widthSize * 0.1),
//                   child: Text(
//                     "Nome",
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontFamily: "Montserrat",
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Observer(
//               builder: (_) {
//                 return _textField(
//                   onChanged: controller.setName,
//                   currentFocus: _nameNode,
//                   nextFocus: _emailNode,
//                   keyboardType: TextInputType.emailAddress,
//                   // errorText: controller.validate,
//                   widthSize: widthSize,
//                   primaryColor: primaryColor,
//                   secondaryColor: secondaryColor,
//                 );
//               },
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 16.0),
//               child: Container(
//                 width: widthSize,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: widthSize * 0.1),
//                   child: Text(
//                     "E-mail",
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontFamily: "Montserrat",
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Observer(builder: (_) {
//               return _textField(
//                 onChanged: controller.setEmail,
//                 currentFocus: _emailNode,
//                 nextFocus: _passwordNode,
//                 keyboardType: TextInputType.emailAddress,
//                 errorText: controller.validateEmail,
//                 widthSize: widthSize,
//                 primaryColor: primaryColor,
//                 secondaryColor: secondaryColor,
//               );
//             }),
//             Padding(
//               padding: EdgeInsets.only(top: 16.0),
//               child: Container(
//                 width: widthSize,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: widthSize * 0.1),
//                   child: Text(
//                     "Senha",
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontFamily: "Montserrat",
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Observer(builder: (_) {
//               return _textField(
//                 onChanged: controller.setPassword,
//                 currentFocus: _passwordNode,
//                 keyboardType: TextInputType.visiblePassword,
//                 errorText: controller.validatePassword,
//                 widthSize: widthSize,
//                 primaryColor: primaryColor,
//                 secondaryColor: secondaryColor,
//               );
//             }),
//             Observer(builder: (_) {
//               return Padding(
//                 padding: EdgeInsets.only(top: 16.0),
//                 child: StateButton(
//                   subState: controller.subState,
//                   onTap: () {
//                     print("object");
//                     controller.createUser(() {
//                       Modular.to.pushReplacementNamed("/login");
//                     });
//                   },
//                   primaryColor: primaryColor,
//                   secondaryColor: secondaryColor,
//                   textLabel: Text(
//                     "Confirmar",
//                     style: TextStyle(
//                       fontFamily: "Montserrat",
//                       fontSize: 20,
//                       color: secondaryColor,
//                     ),
//                   ),
//                 ),
//               );
//             })
//           ],
//         ),
//       ),
//     ));
//   }

//   _textField({
//     String labelText,
//     onFinished,
//     onChanged,
//     onSubmit,
//     String Function() errorText,
//     currentFocus,
//     nextFocus,
//     keyboardType,
//     Color primaryColor,
//     Color secondaryColor,
//     double widthSize,
//     double heightSize,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 5),
//       child: Theme(
//         data: Theme.of(context).copyWith(
//           primaryColor: primaryColor,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: widthSize * 0.8,
//               decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(8.0)),
//               child: TextFormField(
//                 obscureText: keyboardType == TextInputType.visiblePassword ? controller.visibility : false,
//                 keyboardType: keyboardType,
//                 focusNode: currentFocus,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) {
//                   if (nextFocus != null) {
//                     // _fieldFocusChange(
//                     //     context: context,
//                     //     currentFocus: currentFocus,
//                     //     nextFocus: nextFocus);
//                     FocusScope.of(context).requestFocus(nextFocus);
//                   } else {
//                     onSubmit();
//                   }
//                 },
//                 onChanged: onChanged,
//                 cursorColor: primaryColor,
//                 style: TextStyle(
//                   color: primaryColor,
//                 ),
//                 decoration: InputDecoration(
//                     filled: true,
//                     fillColor: secondaryColor,
//                     contentPadding: EdgeInsets.all(12.0),
// //        prefixIcon: keyboardType == TextInputType.emailAddress ? Icon(Icons.alternate_email) : Icon(Icons.lock_outline),
//                     suffixIcon: keyboardType == TextInputType.visiblePassword
//                         ? IconButton(
//                             icon: controller.visibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
//                             onPressed: controller.changeVisibility,
//                           )
//                         : null,
//                     labelText: labelText,
//                     labelStyle: TextStyle(color: primaryColor),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: primaryColor),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: primaryColor),
//                     ),
//                     errorText: errorText != null ? errorText() : null,
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.redAccent, width: 0.0),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red, width: 0.0),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     errorStyle: TextStyle(fontSize: 18)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
