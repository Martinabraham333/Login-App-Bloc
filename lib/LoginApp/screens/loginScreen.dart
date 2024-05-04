
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/LoginApp/bloc/login_bloc.dart';
import 'package:login_app_bloc/LoginApp/screens/HomePage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is loginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is LoginSucess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                        onPressed: () async {
                          context.read<LoginBloc>().add(LoginRequested(
                              username: _userNameController.text,
                              password: _passwordController.text));
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return HomePage();
                          //
                          // )
                          // );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              )),
            ),
          );
        } 
      },
    );
  }
}

























// import 'package:block_tutorial/LoginApp/bloc/login_bloc.dart';
// import 'package:block_tutorial/LoginApp/screens/HomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});
//   TextEditingController _userNameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state is loginFailure) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("${state.error}")));
//         } else if (state is LoginSucess) {
//           Navigator.pushAndRemoveUntil(context,
//               MaterialPageRoute(builder: (context) {
//             return HomePage();
//           }), (route) => false);
//         }
//       },
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Center(
//             child: BlocBuilder<LoginBloc, LoginState>(
//               builder: (context, state) {
//                 if (state is LoginLoading) {
//                   return CircularProgressIndicator();
//                 }
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: 200,
//                     ),
//                     TextField(
//                       controller: _userNameController,
//                       decoration: InputDecoration(hintText: "Username"),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(hintText: "Password"),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: TextButton(
//                           onPressed: () async {
//                             context.read<LoginBloc>().add(LoginRequested(
//                                 username: _userNameController.text,
//                                 password: _passwordController.text));
//                             // Navigator.push(context,
//                             //     MaterialPageRoute(builder: (context) {
//                             //   return HomePage();
//                             //
//                             // )
//                             // );
//                           },
//                           child: Text(
//                             "Login",
//                             style: TextStyle(color: Colors.white),
//                           )),
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
