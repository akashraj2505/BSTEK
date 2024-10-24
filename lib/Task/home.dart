import 'package:bstek/Task/login.dart';
import 'package:flutter/material.dart';


class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Splash.png",
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 10,),
              Text("Book Appointment",style: TextStyle(fontSize: 40,color: Colors.deepPurpleAccent,fontWeight: FontWeight.w900),),
              SizedBox(height: 10,),
              Text("Book Doctor's Appointment For\nthe patients",style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20),)),

                  ),
                ),
                onTap: ()=>{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()),),
                },
              ),



            ],
          ),
        ),
      ),
    );
  }
}