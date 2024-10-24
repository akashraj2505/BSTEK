import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class appointment extends StatefulWidget {
  const appointment({super.key});

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  DateTime? selectedDate;
  int selectedbox=-1;
  int selectedIndex= -1;
  final _formKey = GlobalKey<FormState>();
  List list=[
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
  ];

  List month=[
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  List time=[
    "7 AM",
    "8 AM",
    "9 AM",
    "10 AM",
    "7 PM",
    "8 PM",
    "9 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              leading: Icon(Icons.menu_outlined,color: Colors.white,),
              title: Text("Appointment",style: TextStyle(color: Colors.white),),
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),

        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 75,
                    width:MediaQuery.of(context).size.width ,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("Dr.John",
                          style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                        Text("Heart Specialist",
                          style: TextStyle(color: Colors.blue,fontSize: 20,),),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Schedules",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 200,),
                    Text("August",style: TextStyle(color: Colors.black54,fontSize: 20),),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
                Container(
                  height: 100,

                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (BuildContext c ,index)
                      {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedbox=index;
                            });
                          },
                          child: Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: selectedbox == index ? Colors.deepPurpleAccent : Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: selectedbox == index ? Colors.blue : Colors.black),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(list[index],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: selectedbox == index ? Colors.white : Colors.black,),),
                                      Text(month[index],style: TextStyle(fontSize: 15,color: selectedbox == index ? Colors.white : Colors.black,),)
                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Visit Hours",style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold) ,),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: time.length,
                      itemBuilder: (BuildContext c ,index)
                      {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedIndex = index; // Update the selected index
                            });
                          },
                          child: Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: selectedIndex == index ? Colors.deepPurpleAccent : Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: selectedIndex == index ? Colors.blue : Colors.black),
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(time[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: selectedIndex == index ? Colors.white : Colors.black,),),

                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Patient",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: "Enter the Mobile Number"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Number';
                      } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                        return 'Please enter a valid Number';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 75,
                        color: Colors.white,
                        child: Center(child: Text("MRD23")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 275,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("John Smith"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(onPressed: (){},
                                  child: Text("Select",
                                    style: TextStyle(color: Colors.white),),),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 75,
                        color: Colors.white,
                        child: Center(child: Text("MRD23")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 275,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("William"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),

                                child: TextButton(onPressed: (){},
                                  child: Text("Select",
                                    style: TextStyle(color: Colors.white),),),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    width: 390,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          OverlayEntry overlayEntry = OverlayEntry(
                            builder: (context) => Positioned(
                              top: 100,
                              left: MediaQuery.of(context).size.width / 2 - 100,
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Appointment Confirmed",
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          );

                          Overlay.of(context)!.insert(overlayEntry);
                          Future.delayed(Duration(seconds: 3), () {
                            overlayEntry.remove();
                          });
                        }
                      },

                      child: Text(
                        "Book Appointment",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),

              ],
            ),
          ),
        ),
      ),
    );
  }


}