import 'package:flutter/material.dart';

import 'Episode1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  Animation<double> _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);

    // _animation.addStatusListener((status) {
    //   if(status == AnimationStatus.completed) {
    //     _animationController.reverse();
    //   } else if(status == AnimationStatus.dismissed) {
    //     _animationController.forward();
    //   }
    // });

    _curvedAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if(status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Episode1();
  }
}

