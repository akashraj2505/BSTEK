import 'package:bstek/Task/appointment.dart';
import 'package:flutter/material.dart';

class doctor extends StatefulWidget {
  const doctor({super.key});

  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            leading: Icon(
              Icons.menu_outlined,
              color: Colors.white,
            ),
            title: Text(
              "Doctor List",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.jpeg"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 350,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(5),),
                      hintText: "Search Doctor..",
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 800,
              width: 370,
              child: ListView.builder
                (
                  itemCount: 10,
                  itemBuilder: (BuildContext con,index)
                  {
                    return  GestureDetector(
                      onTap: ()=>{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const appointment())),
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 90,
                            width: 350,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Dr.John",
                                        style: TextStyle(fontSize: 20),
                                      ),

                                      Container(
                                        height: 25,
                                        width: 140,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Colors.redAccent,
                                        ),
                                        child: Text("Book Appointment",
                                            style: TextStyle(color: Colors.white)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Heart Specialist",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 140,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Colors.orangeAccent,
                                        ),
                                        child: Text(
                                          "7 AM - 10PM",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}