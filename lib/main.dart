import 'package:activity_tracker/views/home_view.dart';
import 'package:activity_tracker/wigets/provider_widget.dart';
import 'package:flutter/material.dart';
// import 'package:activity_tracker/pages/navigation_view.dart';
import 'package:activity_tracker/views/first_view.dart';
import 'package:activity_tracker/views/sign_up_view.dart';
// import 'package:activity_tracker/widgets/provider_widget.dart';
import 'package:activity_tracker/services/auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "Travel Budget App",
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SignUpView(
          authFormType: AuthFormType.signUp,
        ),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          '/home': (BuildContext context) => HomeController(),
          '/signIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          // '/anonymousSignIn': (BuildContext context) =>
          //     SignUpView(authFormType: AuthFormType.anonymous),
          // '/convertUser': (BuildContext context) =>
          //     SignUpView(authFormType: AuthFormType.convert),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeView() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
