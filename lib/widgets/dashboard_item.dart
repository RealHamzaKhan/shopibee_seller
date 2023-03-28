import 'package:emart_seller/consts/const.dart';
Widget dashboardItem({required BuildContext context,required String title,required String count,required String image}){
  return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title.text.white.bold.size(20).make(),
                      count.text.bold.white.size(20).make(),
                    ],
                  ),
                  Image.asset(image,width: 40,color: Colors.white,),
                ],
              ).box.color(purpleColor).rounded.size(context.screenWidth*0.45, context.screenHeight*0.1).make();
}