import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:udecproject/loginpage.dart';

void main() => runApp(const MaterialApp(home : HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),
      bodyTextStyle:  TextStyle(fontSize: 18,color: Colors.yellow,),
      imagePadding: EdgeInsets.all(20),
      boxDecoration: BoxDecoration(
        gradient:  LinearGradient(
          begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [.1,.5,.7,.9],
            colors: [
              Colors.orange,
              Colors.deepOrangeAccent,
              Colors.red,
              Colors.redAccent,
            ]
        )
      )
    );

    return IntroductionScreen(
     // globalBackgroundColor: Colors.deepPurple,
      pages: [
        PageViewModel(
          decoration: pageDecoration,
            title: "First Page",
            body:
                """Introduction Screen allows you to have a screen on an app's 
                 first launch to, for example, explain your app. 
                 This widget is very customizable with a great design.""",
            image: introImage(
                "https://images.unsplash.com/photo-1560263816-d704d83cce0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")),
        PageViewModel(
            decoration: pageDecoration,
            title: "Second Page",
            body:
                """Introduction Screen allows you to have a screen on an app's 
                 first launch to, for example, explain your app. 
                 This widget is very customizable with a great design.""",
            image: introImage(
                "https://images.unsplash.com/photo-1564514476902-542f8c30121e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnV0dGVyZmx5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60")),

        PageViewModel(
          decoration: pageDecoration,
            title: "Second Page",
            body:
                """Introduction Screen allows you to have a screen on an app's 
                 first launch to, for example, explain your app. 
                 This widget is very customizable with a great design.""",
            image: introImage(
                "https://images.unsplash.com/photo-1564514476902-542f8c30121e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnV0dGVyZmx5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60")),
      ],
      onDone: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage())),
      onSkip: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage())),
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Continue to Home'),
      dotsDecorator: const DotsDecorator(
        size: Size(10,10),
        color: Colors.white,
        activeSize: Size(22,10),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))
      ),
    );
  }

  Widget introImage(String image) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.network(
        image,
        width: 350,
      ),
    );
  }
}
