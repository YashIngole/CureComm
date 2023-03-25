// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _email, _password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextFormField(
//                   validator: (input) {
//                     if (input.isEmpty) {
//                       return 'Please enter an email';
//                     }
//                     return null;
//                   },
//                   onSaved: (input) => _email = input,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                   ),
//                 ),
//                 TextFormField(
//                   validator: (input) {
//                     if (input.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                   onSaved: (input) => _password = input,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       _formKey.currentState.save();
//                       // TODO: Authenticate user and navigate to next page
//                     }
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
