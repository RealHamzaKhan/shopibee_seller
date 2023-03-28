import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/widgets/textstyles.dart';
Widget popupmenuItem({required IconData icon,required String title,required Function ontap}){
  return Row(
                    
                      children: [
                        Icon(icon),
                        10.widthBox,
                        boldText(value: title,color: Colors.black)
                      ],
                    ).onTap(() {ontap;}).p4();
}