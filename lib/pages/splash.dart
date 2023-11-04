import 'package:chairsapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../view_models/List_categorys.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: FutureBuilder(
        future: Provider.of<Categorie_list>(context, listen: false).fetchCategorey(),
        builder: (BuildContext context, snapshot) {
          Provider.of<Categorie_list>(context, listen: false).Check_auth();
          Provider.of<Categorie_list>(context, listen: false).get_user();

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
                backgroundColor: Colors.black,
                strokeWidth: 8,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              Provider.of<Categorie_list>(context, listen: false).categorys.isNotEmpty) {
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Navigationpage(),
                ),
              );
            });
            return Container();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error}"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: Colors.black87,
                  backgroundColor: Colors.white,
                  strokeWidth: 8,
                ),
            );
          }
        },
      ),
    );
  }
}

