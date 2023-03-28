import 'package:emart_seller/consts/const.dart';
Widget orderPlacedDetails({title1,subtitle1,title2,subtutle2}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "$title1".text.bold.make(),
          '$subtitle1'.text.make()
        ],
      ),
      SizedBox(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "$title2".text.bold.make(),
            '$subtutle2'.text.make()
          ],
        ),
      )
    ],
  ).paddingAll(10);
}