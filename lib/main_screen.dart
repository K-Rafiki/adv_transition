import 'package:flutter/material.dart';
import 'package:test_transition/secondary_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Icon(Icons.favorite), title: const Text("Main Screen"), actions: [
        MaterialButton(
          onPressed: (){
              Navigator.push(context, PageRouteBuilder(pageBuilder: (context,anim,anim2)=> const SecondaryScreen(),
                  transitionDuration: const Duration(milliseconds: 1000),
                  transitionsBuilder: (context,animation,anim2,child){

                Animation darkish = Tween(begin: 0.0, end:0.3).animate(animation);
                return Stack(
                  children: <Widget>[
                    SlideTransition(
                        position:  Tween<Offset>(
                          begin: const Offset(0.0, 0.0),
                          end: const Offset(-0.3, 0.0),
                        ).chain(CurveTween(curve: Curves.easeInOutQuart)).animate(animation),
                        child: widget),
                    Opacity(opacity: darkish.value, child: Container(color:Colors.black)),
                    SlideTransition(
                        position:  Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).chain(CurveTween(curve: Curves.easeInOutQuart)).animate(animation),
                        child: const SecondaryScreen())
                  ],
                );
              }

              ));

          }, child: const Text("Second Screen", style:TextStyle(color:Colors.white)),
        )
      ],),
      body: ListView(
        children: [
          for (int i = 0 ; i < 20 ; i++)
            ListTile(title: Text( i == 0 ? "Scroll Down to item 20. Then press second Screen" : "item $i", style: const TextStyle(fontSize: 13)),),
        ],
      ),
    );
  }
}
