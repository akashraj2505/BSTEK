import 'package:bstek/Task/doctor.dart';
import 'package:bstek/Task/login.dart';
import 'package:flutter/material.dart';
class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List Category = [
    'assets/D_img1.png',
    'assets/D_img2.png',
    'assets/D_img3.png',
    'assets/D_img4.png',
  ];

  List<String> Name =[
    "General",
    "ENT",
    "Dental",
    "Cardio"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          leading:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){ Scaffold.of(context).openDrawer();},
                    icon:Icon(Icons.menu,color: Colors.white,)),
              ),
            ],
          ),
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Let's Book the \nAppointment",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Search Categories...",
              ),
            )
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color:Colors.deepPurpleAccent.shade400,
                    image: DecorationImage(
                        image: AssetImage("assets/logo.jpeg"),
                        fit:BoxFit.cover),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        backgroundColor: Colors.deepPurpleAccent.shade400,
        toolbarHeight: 280,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Catogories",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Category.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(Category[index]), fit: BoxFit.cover)),
                          ),
                          SizedBox(height: 10,),
                          Text(Name[index],style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctors",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "All  >   ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 700,
              width: 380,
              child: ListView.builder(
                   scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext con, index) {
                    return GestureDetector(
                      onTap: ()=>{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor())),
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 100,
                            width: 350,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Dr. John",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      // Text("Heart Specialist",style: TextStyle(color: Colors.blue),)
                                      Container(
                                        height: 25,
                                        width: 140,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.orangeAccent,
                                        ),
                                        child: Text("7 am - 7pm",
                                            style:
                                            TextStyle(color: Colors.white)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Senior Doctor",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}