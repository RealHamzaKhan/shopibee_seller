import 'package:emart_seller/consts/const.dart';
Widget normalText({value,color=white,size=14.0}){
  return "$value".text.color(color).size(size).make();
}
Widget boldText({value,color=white,size=14.0}){
  return "$value".text.bold.size(size).color(color).make();
}