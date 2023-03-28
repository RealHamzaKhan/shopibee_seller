import 'package:emart_seller/consts/const.dart';
import 'package:intl/intl.dart' as intl;
AppBar customAppBar({required String title}){
  return AppBar(
        title: title.text.black.make(),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          intl.DateFormat('EEE , MMM d , ' 'yy').format(DateTime.now()).text.color(darkGrey).make().paddingAll(20)
        ],
      );
}