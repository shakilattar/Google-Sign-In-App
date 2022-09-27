import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'controllers/login_controller.dart';
import 'auth_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   backgroundImage:
            //       Image.network(model.userDetails!.photoUrl ?? "").image,
            //   radius: 50,
            // ),
            // Text(model.userDetails!.displayName ?? ""),
            // Text(model.userDetails!.email ?? ""),

            //logout
            ActionChip(
              avatar: Icon(Icons.logout),
              label: Text('Logout'),
              onPressed: () {
                Provider.of<LoginController>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
