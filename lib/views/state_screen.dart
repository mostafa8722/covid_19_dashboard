
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid_19_dashboard/controllers/home_controller.dart';
import 'package:covid_19_dashboard/data/data.dart';
import 'package:covid_19_dashboard/utils/palette.dart';
import 'package:covid_19_dashboard/widgets/country_drop_down.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../widgets/custom_app_bar.dart';

class StateScreen extends StatelessWidget{
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Palette.primaryColor,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics() ,
        slivers: [
          _buildHeader (),
          _buildTabBar(),
          _buildTabBar2(),

          _buildContainer(),
          _buildCharContainer()
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader (){
    return SliverToBoxAdapter(
      child:
     Container(
       margin: EdgeInsets.symmetric(vertical: 20),
       child:  Row(

         children: [
           SizedBox(width: 10,),
           Text("Statistics",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
         ],
       ),
     )
    );
  }

  SliverToBoxAdapter _buildTabBar (){
    return SliverToBoxAdapter(
      child:  DefaultTabController(
        child:  Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TabBar(
            indicator:BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white
            ) ,
            labelColor: Colors.black,
            labelStyle: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20),
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text("My country"),
              Text("Global"),
            ],
            onTap: (index)=>{print(index.toString())},
          ),
        ),
        length: 2,
      )
    );
  }

  SliverToBoxAdapter _buildTabBar2 (){
    return SliverToBoxAdapter(
        child:  DefaultTabController(
          child:  Container(
            height: 50,

            child: TabBar(
               indicatorColor:Colors.transparent,
              labelColor: Colors.white,

              unselectedLabelColor: Colors.white60,
              tabs: <Widget>[
                Text("Total"),
                Text("Today"),
                Text("Yesterday"),
              ],
              onTap: (index)=>{print(index.toString())},
            ),
          ),
          length: 3,
        )
    );
  }
  SliverToBoxAdapter _buildContainer (){
    return SliverToBoxAdapter(
      child: Column(

        children: [


         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             customContainer('Total Cases', '1.81 M', Colors.orange, 80),
             customContainer('Deaths', '105 K', Colors.red, 80),
           ],

         ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customContainer('Recovered', '391 K', Colors.green,80),
              customContainer('Active', '1.31 M', Colors.lightBlue,80),
              customContainer('Critical', 'N/A', Colors.purple,80),

            ],

          ),
        ],
      )
    );
  }

  Widget customContainer(String title, String  value,Color color, double height){
    return

    Expanded(child:
      Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(15),
        color: color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Text(title,style: TextStyle(color: Colors.white,fontSize: 15),),
          Expanded(child: Container()),
          Text(value,style: TextStyle(color: Colors.white,fontSize: 19),),
          SizedBox(height: 5,),
        ],
      ),
    )
    );
  }


  SliverToBoxAdapter _buildCharContainer (){
    return SliverToBoxAdapter(
        child:


       Container(
         height: 350,
         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: Colors.white
         ),
         child:Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Daily new Cases",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             SizedBox(height: 10,),
             Container(
               height: 250,
               child: BarChart(
                   BarChartData(
                     alignment: BarChartAlignment.spaceAround,
                     maxY: 16.0,
                     barTouchData: BarTouchData(enabled: false),
                     titlesData: FlTitlesData(
                       show: true,

                         bottomTitles: AxisTitles(sideTitles:


                          SideTitles(

                         showTitles: true,
                            getTitlesWidget: (value, meta) {
                              String text = '';
                              switch (value.toInt()) {
                                case 0:
                                  text = 'May 24';
                                  break;
                                case 1:
                                  text =  'May 25';
                                  break;
                                case 2:
                                  text = 'May 26';
                                  break;

                                case 3:
                                  text = 'May 27';
                                  break;
                                case 4:
                                  text =  'May 28';
                                  break;
                                case 5:
                                  text = 'May 29';
                                  break;
                                case 6:
                                  text = 'May 30';
                                  break;
                                default:
                                  text = '';
                                  break;
                              }


                              return Text(text);
                            },


                       ),  ),
                       leftTitles:
                       AxisTitles(sideTitles:
                       SideTitles(
                         showTitles: true,
                         getTitlesWidget: (value, meta) {
                           String text = '';
                           if (value == 0) {
                             text =  '0';
                           } else if (value % 3 == 0) {
                             text = '${value ~/ 3 * 5}K';
                           }


                           return Text(text);
                         },
                       )
                       )

                     ),
                     gridData: FlGridData(
                       show: false,
                       checkToShowHorizontalLine: (value)=> value%3==0,
                       getDrawingHorizontalLine: (value)=>FlLine(
                         color: Colors.black12,
                         strokeWidth: 1.0,
                         dashArray: [5],
                       ),
                     ),
                     borderData: FlBorderData(show: false),
                     barGroups: covidUSADailyNewCases.asMap().map((key, value) =>
                         MapEntry(key,
                             BarChartGroupData(x: key,
                                 barRods: [
                                   BarChartRodData(toY: value,
                                       color: Colors.red
                                   )
                                 ]
                             )
                         )
                     ).values.toList(),


                   )
               )

               ,
             )
           ],
         ) ,
       )
    );
  }
}