import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quantum_app/controllers/login_controller.dart';
import 'package:quantum_app/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Social '),
            Text(
              'X',
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: _mediaQuery.size.height * 0.08,
              width: _mediaQuery.size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: _mediaQuery.size.width * 0.01),
                  SizedBox(
                    width: _mediaQuery.size.width * 0.4,
                    height: _mediaQuery.size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('LOGIN'),
                    ),
                  ),
                  //SizedBox(width: _mediaQuery.size.width * 0.05),
                  SizedBox(
                    width: _mediaQuery.size.width * 0.4,
                    height: _mediaQuery.size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.red),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.red),
                        primary: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: _mediaQuery.size.width * 0.03),
                ],
              ),
            ),
            Container(
              height: _mediaQuery.size.height * 0.4,
              child: Card(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            key: const ValueKey(
                                'email'), // used for do not pass value between textformfields(ValueKey)
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: 'Email Address'),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              //_userEmail = value!;
                            },
                          ),
                          TextFormField(
                            key: const ValueKey('password'),
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'Password must be 6 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              //_userPassword = value!;
                            },
                          ),
                          SizedBox(height: _mediaQuery.size.height * 0.02),
                          Text('Login With'),
                          SizedBox(height: _mediaQuery.size.height * 0.01),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                  child: GestureDetector(
                                    child: Image(
                                      height: _mediaQuery.size.height * 0.1,
                                      width: _mediaQuery.size.width * 0.1,
                                      image: AssetImage('assets/google.png'),
                                    ),
                                    onTap: () {
                                      Provider.of<LoginController>(context,
                                              listen: false)
                                          .googleLogin();
                                      Navigator.of(context).pushNamed('/home');
                                    },
                                  ),
                                ),
                                ClipRRect(
                                  child: GestureDetector(
                                    child: Image(
                                      height: _mediaQuery.size.height * 0.1,
                                      width: _mediaQuery.size.width * 0.1,
                                      image: AssetImage('assets/facebook.png'),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginUI() {
    //loginUI

    //loginControllers
    return Consumer<LoginController>(builder: (context, model, child) {
      //if we are already login
      if (model.userDetails != null) {
        return Center(
          child: HomeScreen(),
          // child: loggedInUI(model),
        );
      } else {
        return loginControllers(context);
      }
    });
  }

  // loggedInUI(LoginController model) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,

  //     //our ui will have 4 childrens name, email, photo, logout
  //     children: [
  //       CircleAvatar(
  //         backgroundImage:
  //             Image.network(model.userDetails!.photoUrl ?? "").image,
  //         radius: 50,
  //       ),
  //       Text(model.userDetails!.displayName ?? ""),
  //       Text(model.userDetails!.email ?? ""),

  //       //logout
  //       ActionChip(
  //         avatar: Icon(Icons.logout),
  //         label: Text('Logout'),
  //         onPressed: () {
  //           Provider.of<LoginController>(context, listen: false).logout();
  //         },
  //       ),
  //     ],
  //   );
  // }

  loginControllers(BuildContext context) {
    //var _mediaQuery = MediaQuery.of(context);
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              'assets/google.png',
              height: 0.1,
              width: 0.1,
            ),
            onTap: () {
              Provider.of<LoginController>(context, listen: false)
                  .googleLogin();
            },
          ),
          Image.asset(
            'assets/facebook.png',
            height: 0.1,
            width: 0.1,
          ),
          //Icon(Icons.google)
        ],
      ),
    );
  }
}
