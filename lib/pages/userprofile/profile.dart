import 'package:chairsapp/api/api.server.dart';
import 'package:chairsapp/main.dart';
import 'package:chairsapp/pages/userprofile/googlelogin.dart';
import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cartcompenents/cart.dart';

class Profileinfo extends StatefulWidget {
  const Profileinfo({super.key});

  @override
  State<Profileinfo> createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo> {
  @override
  void initState() {
    super.initState();
    Provider.of<Categorie_list>(context, listen: false).Check_auth();
    Provider.of<Categorie_list>(context, listen: false).get_user();
  }

  Widget build(BuildContext context) {
    return Consumer<Categorie_list>(
      builder: (context, value, child) => SafeArea(
        child: (value.Authontecated)
            ? Container(
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(Apiserver.Myuser.image!),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      Apiserver.Myuser.username!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(Apiserver.Myuser.email!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(left: 40),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all()),
                              child: Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20,
                                      )))),
                        ],
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * .5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(30),
                          //   topRight: Radius.circular(30),
                          // )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30),
                          child: Column(children: [
                            profilebutton(
                                context,
                                'My Orders',
                                Icon(
                                  Icons.local_shipping_outlined,
                                  size: 20,
                                ),
                                () {}),
                            profilebutton(
                                context,
                                'My Favorites',
                                Icon(
                                  Icons.favorite,
                                  size: 20,
                                ), () {
                              value.edit_index(1);
                            }),
                            profilebutton(
                                context,
                                'Cart',
                                Icon(
                                  Icons.shopping_bag_sharp,
                                  size: 20,
                                ), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CartPage()), //////to cart
                              );
                            })
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30),
                          child: Column(children: [
                            profilebutton(
                                context,
                                'Shipping addresses',
                                Icon(
                                  Icons.location_on,
                                  size: 20,
                                ),
                                () {}),
                            profilebutton(
                                context,
                                'Contact Support',
                                Icon(
                                  Icons.contact_support_sharp,
                                  size: 20,
                                ),
                                () {}),
                            profilebutton(
                                context,
                                'Logout',
                                const Icon(
                                  Icons.logout_outlined,
                                  size: 20,
                                ), () {
                              Authontication.removeData('auth');
                              Provider.of<Categorie_list>(context,
                                      listen: false)
                                  .Check_auth();
                            }),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Googlelogin(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InkWell profilebutton(
      BuildContext context, String action, Icon icon, Function f) {
    return InkWell(
      onTap: () {
        f();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all()),
                    child: Center(
                        child: IconButton(
                      onPressed: null,
                      icon: icon,
                    ))),
                SizedBox(
                  width: 20,
                ),
                Text(
                  action,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
