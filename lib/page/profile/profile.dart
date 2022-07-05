import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happymovie/widgets/button_widget.dart';

import '../../helper/local_data/get_local_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //appbar
          const Padding(
            padding: EdgeInsets.only(top: 35),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFDAA520)),
              ),
            ),
          ),
          //Profile
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                CupertinoIcons.person_alt_circle_fill,
                color: Colors.grey,
                size: 80,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'umkithya@gmail.com',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFDAA520)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: customButtonWidgets(
                isUnhide: true,
                textTitle: 'Language',
                subTitle: 'English',
                unhideIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
            ),
            child: customButtonWidgets(textTitle: 'Privacy Policy'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
            ),
            child: customButtonWidgets(textTitle: 'Legal Information'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
            ),
            child: customButtonWidgets(
                textTitle: 'Version',
                isUnhide: true,
                unhideIcon: false,
                subTitle: ' 1.0.0'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
            child: ButtonWidget.roundedButton(
              backgroundColor: const Color(0xFFDAA520),
              title: 'Logout',
              height: 35,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
              radius: 2,
              onTap: () async {
                await LocalDataStorage.removeCurrentUser();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: Image.network(
                'https://www.coca-colacompany.com/content/dam/journey/us/en/articles/desktop/coca-cola-comeback-bottle-recycle.png',
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      )),
    );
  }

  customButtonWidgets({
    String textTitle = '',
    bool isUnhide = false,
    String subTitle = '',
    bool unhideIcon = true,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 40,
          color: const Color(0xFF1B1B1B),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    textTitle,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFDAA520)),
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: isUnhide,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          subTitle,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: unhideIcon,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.navigate_next,
                          color: Color(0xFFDAA520),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
