import 'package:chairsapp/models/auth.dart';
import 'package:chairsapp/pages/favoritecompenents/favorite.dart';
import 'package:chairsapp/pages/homecompenents/home.dart';
import 'package:chairsapp/pages/splash.dart';
import 'package:chairsapp/pages/userprofile/profile.dart';
import 'package:chairsapp/view_models/CartProduct.dart';
import 'package:chairsapp/view_models/Favorit_provider.dart';
import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uni_links/uni_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Authontication.getData('auth');
  var data = Authontication.getData('auth');

  runApp(const Mainpage());
}

auth Authontication = auth();
List<Widget> pages = [
  home(),
  Favorite(),
  Container(
    color: Colors.black,
  ),
  Profileinfo()
];

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.orange, // Define your primary color
    hintColor: Colors.red, // Define an accent color
    fontFamily: 'Roboto', // Define a default font family

    textTheme: TextTheme(
      bodyText1:
          TextStyle(fontSize: 16, color: Colors.black), // Define text styles
      bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
      // Add more text styles as needed
    ),
  );
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Categorie_list()),
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

class Navigationpage extends StatefulWidget {
  const Navigationpage({super.key});

  @override
  State<Navigationpage> createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  int _selectedIndex = 0;

  // String name = "ALL";

  @override
  Widget build(BuildContext context) {
    return Consumer<Categorie_list>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                color: Colors.grey,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                  ),
                  GButton(
                    icon: Icons.notifications_none_outlined,
                  ),
                  GButton(
                    icon: Icons.person_2_outlined,
                  ),
                ],
                selectedIndex: value.index_page,
                onTabChange: (index) {
                  setState(() {
                    value.edit_index(index);
                  });
                },
              ),
            ),
          ),
        ),
        body: pages[value.index_page],
      ),
    );
  }
}
