
  import 'package:get/get.dart';

class HomeController extends GetxController{
  var country = "USA".obs;
  var nav_selected = 0.obs;

  changeCountry(e){
    country.value = e;
  }

  changeNav(e){
    nav_selected.value = e;
  }
}