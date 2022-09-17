
 import 'package:covid_19_dashboard/controllers/home_controller.dart';
import 'package:covid_19_dashboard/data/data.dart';
import 'package:covid_19_dashboard/utils/palette.dart';
import 'package:covid_19_dashboard/widgets/country_drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget{
   HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics() ,
        slivers: [
          _buildHeader(),
          _buildPrevention(),
          _buildBanner()
        ],
      ),
    );
  }
  SliverToBoxAdapter _buildHeader (){
    return SliverToBoxAdapter(
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Obx((){
             return  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("COVID-19",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                 CountryDropDown(countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                     country:
                     controller.country.value
                     , onChanged:( e)=> controller.changeCountry(e))
               ],
             );
           }),

            Text("Are you feeling Seek?",style:TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
            SizedBox(height: 5,),
            Text("If you feel seek with any covid-19 symptoms,\n please call or text up immediatelly",style:TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.w300)),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(onPressed: (){print("phone");},
                    icon: Icon(Icons.phone,color: Colors.white,size: 16,),
                    label: Text("Call Now",style: TextStyle(color: Colors.white,fontSize: 16),),
                  color: Colors.red,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                FlatButton.icon(onPressed: (){print("phone");},
                  icon: Icon(Icons.message,color: Colors.white,size: 16,),
                  label: Text("Send Sms",style: TextStyle(color: Colors.white,fontSize: 16),),
                  color: Colors.blue,
                 height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
      );
}
   SliverToBoxAdapter _buildPrevention(){
    return SliverToBoxAdapter(

         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 10,),
           Row(
             children: [
               SizedBox(width: 10,),
               Text(   'Prevention Tips',style: TextStyle(fontSize: 20),),],
           ),

             SizedBox(height: 5,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: prevention.map((e) =>
               Column(
                 children: [
                   Container(
                     height: 80,
                     width: 80,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       image: DecorationImage(
                         image: AssetImage(e.keys.first),
                         fit: BoxFit.cover
                       )
                     ),
                   ),
                   SizedBox(height: 4,),
                   Text(
                     e.values.first,
                     style: TextStyle(color: Color(0xff565656),fontSize: 18),
                     textAlign: TextAlign.center,
                   ),

                 ],
               )

               ).toList(),
             )
           ],
         ),
    );
   }

   Widget _buildBanner(){
    return SliverToBoxAdapter(
    child:
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Palette.primaryColor.withOpacity(0.3),
            Palette.primaryColor.withOpacity(0.8),
          ]
        )
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/own_test.png',height: 150,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do your own test! ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                ,SizedBox(height: 10,)
                ,Text("Follow the instructions\nto do your own test.",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w200),)
              ],
            )
          ],
        ),
    )
    );
   }

}