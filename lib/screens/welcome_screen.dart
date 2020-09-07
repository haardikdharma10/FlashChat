import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/roundedbutton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  //By using TickerProviderStateMixin we enable our welcomescreenstate to act as a ticker provider
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 1),vsync: this); 
      //This means the current welcome screen state object will provide the ticker for animationcontroller
      //vsync is a required property of AnimationController
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    // animation.addStatusListener((status){
    //   if(status == AnimationStatus.completed){
    //     //The above statement means when the forward animation is ended
    //     controller.reverse(from: 1.0);
    //   }
    //   else if(status == AnimationStatus.dismissed){
    //     //When the reverse animation is ended
    //     controller.forward();
    //   }
    // });

    controller.forward();
    controller.addListener((){
      setState(() {
      });
        print(animation.value);
    });
  }

  @override
  void dispose() {
    //A method to stop the animation so that it doesn't bounce back and forth.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
                children: <Widget>[
                  Hero(
                    tag: 'icon',
                      child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: const Duration(milliseconds: 200),
                  textStyle: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.w900,
                  ),
                    ),
                ],
              ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log In', color: Colors.lightBlueAccent, onPressed: () {
              Navigator.pushNamed(context, '/login');
          },),
            RoundedButton(title: 'Register', color: Colors.blueAccent, onPressed: () {
              Navigator.pushNamed(context, '/registration');
          },)
          ],
        ),
      ),
    );
  }
}


