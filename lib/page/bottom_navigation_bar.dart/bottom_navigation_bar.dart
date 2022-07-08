import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happymovie/config/route/app_route.gr.dart';

class ButtomNavigationBar extends StatelessWidget {
  const ButtomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declaraed as children
      // routes of /dashboard
      routes: [
        const HomeRoute(),
        const MoviesRoute(),
        TVShowRoute(),
        const FavoriteRoute(),
        const ProfileRoute(),
      ],
      builder: (context, child, animation) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key

        return Scaffold(
          body: child,

          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: const Color(0xFFDAA520),
            color: const Color(0xFF242424),
            index: tabsRouter.activeIndex,
            items: const <Widget>[
              Icon(CupertinoIcons.home, size: 30, color: Colors.white),
              Icon(CupertinoIcons.star_circle_fill,
                  size: 30, color: Colors.white),
              Icon(Icons.live_tv, size: 30, color: Colors.white),
              Icon(CupertinoIcons.heart_circle, size: 30, color: Colors.white),
              Icon(CupertinoIcons.person_alt_circle,
                  size: 30, color: Colors.white),
            ],
            onTap: (index) async {
              //Handle button tap
              // await DefaultCacheManager().emptyCache();
              debugPrint('index:$index');
              tabsRouter.setActiveIndex(index);
            },
          ),

          // BottomNavigationBar(
          //   currentIndex: tabsRouter.activeIndex,
          //   onTap: (index) {
          //     // here we switch between tabs
          //     tabsRouter.setActiveIndex(index);
          //   },
          //   items: const [
          //     // BottomNavigationBarItem(label: 'Users',...),
          //     // BottomNavigationBarItem(label: 'Posts',...),
          //     // BottomNavigationBarItem(label: 'Settings',...),
          //   ],
          // ),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Home"),
    //     centerTitle: true,
    //     automaticallyImplyLeading: false,
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.exit_to_app),
    //         onPressed: () async{
    //           await LocalDataStorage.removeCurrentUser();
    //           Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const LoginPage()),
    //   );
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}
