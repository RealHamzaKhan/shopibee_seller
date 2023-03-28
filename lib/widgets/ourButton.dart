import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/widgets/textstyles.dart';

Widget ourButton({title,color,onPress}){
  return ElevatedButton(onPressed: onPress,
  style: ElevatedButton.styleFrom(
    backgroundColor: color,
    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ), 
  child: normalText(value: title).centered(),
  );
}