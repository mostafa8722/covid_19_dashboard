
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDropDown  extends StatelessWidget{

  List<String> countries ;
  String country;
  Function(String?) onChanged;
  CountryDropDown({
    required this.countries,
    required this.country,
    required this.onChanged
});
   @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Icon(Icons.keyboard_arrow_down),
        onChanged: onChanged,
          value: country,
           focusColor: Colors.white,
          dropdownColor: Colors.green,
          items: countries.map((e) => 
          DropdownMenuItem(

              value: e,
              child:
              Row(
                children: [
                  CircleAvatar(
                     backgroundColor: Colors.white,

                    child: Image.asset("assets/images/${e.toLowerCase().toString()}_flag.png",height: 30,width: 30,),
                  ),
                  SizedBox(width: 5,),
                  Text(e.toString(),
                  style: TextStyle(
                    color: Color(0xff565655),
                    fontSize: 16
                  ),
                  )
                ],
              )
          )
          
          ).toList(),

        ),
      ),
    );
  }
}