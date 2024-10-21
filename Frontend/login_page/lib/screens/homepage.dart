import 'package:flutter/material.dart';
import 'package:login_page/data/college_data.dart';
import 'package:login_page/model/colleges_model.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {
  CollegeModel? selectedCollege = colleges[Colleges.PSIT];
  
    
  
   @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Expanded(
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 251, 241, 192),
            flexibleSpace: Container
               (
               padding: const EdgeInsets.fromLTRB(16.0,30.0,16.0,16.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 300,
                    child: DropdownButtonFormField(
                                  value :selectedCollege,
                                  items: [
                                  for(final k in colleges.entries)
                                  DropdownMenuItem(
                    value:k.value,
                    child: Text(k.value.name)
                    
                    ),
                    
                                ], onChanged: (value) {
                                  setState(() {
                    selectedCollege = value!;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'SelectCollege',
                                ),),
                  )
                ],
               )
            ) ,
            title: const Align(
              alignment: Alignment.topRight,
              child: const Text('CampusCrave',style: TextStyle(color: Colors.orange),),),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search),iconSize: 27,)],
              

          ),
        ),
      ),
      body: const Text('he'),
        
        
    

    //  body: Padding(
    //    padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
    //    child: Column(
    //      children: [
    //        Align(
    //         alignment: Alignment.topLeft,
    //           child: 
    //             Container
    //             (
    //               width: 150,
    //               child: DropdownButtonFormField(
    //                 value :selectedCollege,
    //                 items: [
    //                 for(final k in colleges.entries)
    //                 DropdownMenuItem(
    //                   value:k.value,
    //                   child: Text(k.value.name)
                      
    //                   ),
                      
    //               ], onChanged: (value) {
    //                 setState(() {
    //                   selectedCollege = value!;
    //                 });
    //               },
    //               decoration: const InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 labelText: 'SelectCollege',
    //               ),),
    //             ),
    //            //const Center(child: Text('Campus',style: TextStyle(color: Colors.orange,fontSize: 20),)),
             
    //             //IconButton(onPressed: () {}, icon: const Icon(Icons.menu),iconSize: 27,)
                        
    //         ),
    //      ],
    //    ),
    //  ),
      
    );
  }
}
