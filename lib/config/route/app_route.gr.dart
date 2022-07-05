// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i13;

import '../../page/bottom_navigation_bar.dart/bottom_navigation_bar.dart'
    as _i2;
import '../../page/favorite_page/favorite_page.dart' as _i7;
import '../../page/home_screen/home_screen.dart' as _i9;
import '../../page/home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart'
    as _i14;
import '../../page/login/login_page.dart' as _i3;
import '../../page/movies_page/movie_rank_page/movie_rank_page.dart' as _i12;
import '../../page/movies_page/movies_page.dart' as _i11;
import '../../page/profile/profile.dart' as _i8;
import '../../page/splash_screen/splash_screen.dart' as _i1;
import '../../page/tv_show.dart/tv_show_page.dart' as _i6;
import '../../page/video/video_detail_page.dart' as _i10;
import '../../page/video_play/video_player.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    ButtomNavigationBarRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ButtomNavigationBar());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    VideoPlayerRouter.name: (routeData) {
      final args = routeData.argsAs<VideoPlayerRouterArgs>(
          orElse: () => const VideoPlayerRouterArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.VideoPlayer(key: args.key, moviesModel: args.moviesModel));
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    MoviesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterScreen());
    },
    TVShowRoute.name: (routeData) {
      final args = routeData.argsAs<TVShowRouteArgs>(
          orElse: () => const TVShowRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.TVShowPage(key: args.key));
    },
    FavoriteRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FavoritePage());
    },
    ProfileRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfilePage());
    },
    HomeScreen.name: (routeData) {
      final args = routeData.argsAs<HomeScreenArgs>(
          orElse: () => const HomeScreenArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.HomeScreen(key: args.key));
    },
    VideoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<VideoDetailRouteArgs>(
          orElse: () => const VideoDetailRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i10.VideoDetail(key: args.key, moviesModel: args.moviesModel));
    },
    MoviesPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.MoviesPage());
    },
    MoviesRankRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MoviesRankPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/sso', fullMatch: true),
        _i5.RouteConfig(SplashScreen.name, path: '/sso'),
        _i5.RouteConfig(ButtomNavigationBarRouter.name,
            path: '/dashboard',
            children: [
              _i5.RouteConfig('#redirect',
                  path: '',
                  parent: ButtomNavigationBarRouter.name,
                  redirectTo: 'home',
                  fullMatch: true),
              _i5.RouteConfig(HomeRoute.name,
                  path: 'home',
                  parent: ButtomNavigationBarRouter.name,
                  children: [
                    _i5.RouteConfig(HomeScreen.name,
                        path: '', parent: HomeRoute.name),
                    _i5.RouteConfig(VideoDetailRoute.name,
                        path: 'detail', parent: HomeRoute.name),
                    _i5.RouteConfig(MoviesPageRoute.name,
                        path: 'movies', parent: HomeRoute.name)
                  ]),
              _i5.RouteConfig(MoviesRoute.name,
                  path: 'movies',
                  parent: ButtomNavigationBarRouter.name,
                  children: [
                    _i5.RouteConfig(MoviesRankRoute.name,
                        path: '', parent: MoviesRoute.name),
                    _i5.RouteConfig(VideoDetailRoute.name,
                        path: 'detail', parent: MoviesRoute.name)
                  ]),
              _i5.RouteConfig(TVShowRoute.name,
                  path: 'tvshow', parent: ButtomNavigationBarRouter.name),
              _i5.RouteConfig(FavoriteRoute.name,
                  path: 'favorite', parent: ButtomNavigationBarRouter.name),
              _i5.RouteConfig(ProfileRoute.name,
                  path: 'profile', parent: ButtomNavigationBarRouter.name)
            ]),
        _i5.RouteConfig('#redirect',
            path: '', redirectTo: '/sso', fullMatch: true),
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(VideoPlayerRouter.name, path: 'video-player')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/sso');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.ButtomNavigationBar]
class ButtomNavigationBarRouter extends _i5.PageRouteInfo<void> {
  const ButtomNavigationBarRouter({List<_i5.PageRouteInfo>? children})
      : super(ButtomNavigationBarRouter.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'ButtomNavigationBarRouter';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.VideoPlayer]
class VideoPlayerRouter extends _i5.PageRouteInfo<VideoPlayerRouterArgs> {
  VideoPlayerRouter({_i13.Key? key, _i14.MoviesModel? moviesModel})
      : super(VideoPlayerRouter.name,
            path: 'video-player',
            args: VideoPlayerRouterArgs(key: key, moviesModel: moviesModel));

  static const String name = 'VideoPlayerRouter';
}

class VideoPlayerRouterArgs {
  const VideoPlayerRouterArgs({this.key, this.moviesModel});

  final _i13.Key? key;

  final _i14.MoviesModel? moviesModel;

  @override
  String toString() {
    return 'VideoPlayerRouterArgs{key: $key, moviesModel: $moviesModel}';
  }
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeRoute.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.EmptyRouterScreen]
class MoviesRoute extends _i5.PageRouteInfo<void> {
  const MoviesRoute({List<_i5.PageRouteInfo>? children})
      : super(MoviesRoute.name, path: 'movies', initialChildren: children);

  static const String name = 'MoviesRoute';
}

/// generated route for
/// [_i6.TVShowPage]
class TVShowRoute extends _i5.PageRouteInfo<TVShowRouteArgs> {
  TVShowRoute({_i13.Key? key})
      : super(TVShowRoute.name,
            path: 'tvshow', args: TVShowRouteArgs(key: key));

  static const String name = 'TVShowRoute';
}

class TVShowRouteArgs {
  const TVShowRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'TVShowRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.FavoritePage]
class FavoriteRoute extends _i5.PageRouteInfo<void> {
  const FavoriteRoute() : super(FavoriteRoute.name, path: 'favorite');

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({_i13.Key? key})
      : super(HomeScreen.name, path: '', args: HomeScreenArgs(key: key));

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.VideoDetail]
class VideoDetailRoute extends _i5.PageRouteInfo<VideoDetailRouteArgs> {
  VideoDetailRoute({_i13.Key? key, _i14.MoviesModel? moviesModel})
      : super(VideoDetailRoute.name,
            path: 'detail',
            args: VideoDetailRouteArgs(key: key, moviesModel: moviesModel));

  static const String name = 'VideoDetailRoute';
}

class VideoDetailRouteArgs {
  const VideoDetailRouteArgs({this.key, this.moviesModel});

  final _i13.Key? key;

  final _i14.MoviesModel? moviesModel;

  @override
  String toString() {
    return 'VideoDetailRouteArgs{key: $key, moviesModel: $moviesModel}';
  }
}

/// generated route for
/// [_i11.MoviesPage]
class MoviesPageRoute extends _i5.PageRouteInfo<void> {
  const MoviesPageRoute() : super(MoviesPageRoute.name, path: 'movies');

  static const String name = 'MoviesPageRoute';
}

/// generated route for
/// [_i12.MoviesRankPage]
class MoviesRankRoute extends _i5.PageRouteInfo<void> {
  const MoviesRankRoute() : super(MoviesRankRoute.name, path: '');

  static const String name = 'MoviesRankRoute';
}
