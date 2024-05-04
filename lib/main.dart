
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/LoginApp/bloc/login_bloc.dart';
import 'package:login_app_bloc/LoginApp/screens/loginScreen.dart';
import 'package:login_app_bloc/app_bloc_observer.dart';

void main() {
   Bloc.observer = App_bloc_Observer();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    
        BlocProvider(
          create: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp(
         
          home: LoginPage()),
    );
  }
}
