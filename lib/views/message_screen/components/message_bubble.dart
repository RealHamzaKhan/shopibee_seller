import 'package:emart_seller/consts/const.dart';

import '../../../consts/colors.dart';
import 'package:intl/intl.dart' as intl;
Widget messageBubble({required bool isSender,required var data}){
  var t=data['created_on']==null?DateTime.now():data['created_on'].toDate();
  var time=intl.DateFormat("h:ma").format(t);
  return Align(
    alignment: isSender?Alignment.bottomRight:Alignment.centerLeft,
    child: Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
          borderRadius: isSender?const BorderRadius.only(topRight: Radius.circular(10),
            topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),
          ):const BorderRadius.only(topRight: Radius.circular(10),
            topLeft: Radius.circular(10),bottomRight: Radius.circular(10),
          ),
          color: isSender?lightGrey:purpleColor
      ),
      child: Column(
        crossAxisAlignment: isSender?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          "${data['message']}".text.color(isSender?Colors.black:Colors.white).size(16).make(),
          10.heightBox,
          time.text.size(13).color(isSender?Colors.black.withOpacity(0.3):Colors.white.withOpacity(0.5)).make()
        ],
      ),
    ).marginOnly(bottom: 5),
  );
}