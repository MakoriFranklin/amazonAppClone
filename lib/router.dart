import "package:amazon_clone/features/auth/screens/auth_screen.dart";
import "package:amazon_clone/features/home/screens/home_screen.dart";
import "package:amazon_clone/shared/widgets/bottom_nav_bar.dart";
import "package:flutter/material.dart";
Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => AuthScreen(),
    );

    case BottomNavBar.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => BottomNavBar(),
    );

    case HomeScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => HomeScreen(),
    );
    default:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> const Scaffold(
        body: Center(
          child: Text("Page Not Found"),
        ),
      )
    );
  }
}