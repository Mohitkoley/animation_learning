import 'package:animation1/parallax_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: ParallaxEffect(
            child: Center(
          child: Image.asset('assets/images/kakashi.jpg'),
        )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut,
        reverseCurve: Curves.easeInCubic));
    animationController.forward().then((value) {
      animationController.reverse().then((value) {
        animationController.repeat();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Scaffold(
              appBar: AppBar(title: Text(widget.title)),
              body: Column(children: [
                Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0, 0),
                    child: const Text("Rockey Bhai")),
              ]));
        });
  }
}
