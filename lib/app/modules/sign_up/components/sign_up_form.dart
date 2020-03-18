// import 'package:flutter/material.dart';

// class SignUpForm extends StatefulWidget {
//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       Form(
//               key: _formController.key,
//               child: Container(
//                 height: heightSize * 0.6,
//                 width: widthSize,
//                 decoration: BoxDecoration(
//                   color: secondaryColor,
//                   border: Border.all(
//                     width: 2,
//                     color: Colors.black,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(top: 16.0),
//                       child: Container(
//                         width: widthSize,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: widthSize * 0.1),
//                           child: Text(
//                             "Nome",
//                             style: TextStyle(
//                               color: primaryColor,
//                               fontFamily: "Montserrat",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Observer(
//                       builder: (_) {
//                         return _textField(
//                           onChanged: controller.setName,
//                           currentFocus: _nameNode,
//                           nextFocus: _emailNode,
//                           keyboardType: TextInputType.emailAddress,
//                           // errorText: controller.validate,
//                           widthSize: widthSize,
//                           primaryColor: primaryColor,
//                           secondaryColor: secondaryColor,
//                         );
//                       },
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 16.0),
//                       child: Container(
//                         width: widthSize,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: widthSize * 0.1),
//                           child: Text(
//                             "E-mail",
//                             style: TextStyle(
//                               color: primaryColor,
//                               fontFamily: "Montserrat",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Observer(builder: (_) {
//                       return _textField(
//                         onChanged: controller.setEmail,
//                         currentFocus: _emailNode,
//                         nextFocus: _passwordNode,
//                         keyboardType: TextInputType.emailAddress,
//                         errorText: controller.validateEmail,
//                         widthSize: widthSize,
//                         primaryColor: primaryColor,
//                         secondaryColor: secondaryColor,
//                       );
//                     }),
//                     Padding(
//                       padding: EdgeInsets.only(top: 16.0),
//                       child: Container(
//                         width: widthSize,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: widthSize * 0.1),
//                           child: Text(
//                             "Senha",
//                             style: TextStyle(
//                               color: primaryColor,
//                               fontFamily: "Montserrat",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Observer(builder: (_) {
//                       return _textField(
//                         onChanged: controller.setPassword,
//                         currentFocus: _passwordNode,
//                         keyboardType: TextInputType.visiblePassword,
//                         errorText: controller.validatePassword,
//                         widthSize: widthSize,
//                         primaryColor: primaryColor,
//                         secondaryColor: secondaryColor,
//                       );
//                     }),
//                     Observer(builder: (_) {
//                       return Padding(
//                         padding: EdgeInsets.only(top: 16.0),
//                         child: StateButton(
//                           subState: controller.subState,
//                           functionResult: () {
//                             print("object");
//                             controller.createUser((){Modular.to.pushReplacementNamed("/login");});
//                           },
//                           primaryColor: primaryColor,
//                           secondaryColor: secondaryColor,
//                           textLabel: Text(
//                             "Confirmar",
//                             style: TextStyle(
//                               fontFamily: "Montserrat",
//                               fontSize: 20,
//                               color: secondaryColor,
//                             ),
//                           ),
//                         ),
//                       );
//                     })
//                   ],
//                 ),
//               ),
//             )
//     );
//   }
// }