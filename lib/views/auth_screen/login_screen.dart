import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/home_screen/home.dart';
import 'package:emart_seller/widgets/ourButton.dart';
import 'package:emart_seller/widgets/textstyles.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(alignment: Alignment.topCenter,child: Image.asset(icLogo,width: context.screenWidth*0.25,)
            .box.border(color: darkGrey).p8.width(context.screenWidth*0.28).clip(Clip.antiAlias).make()),
            10.heightBox,
            normalText(value: welcome,color: lightGrey),
            10.heightBox,
            boldText(value: appname,size: 20.0),
            40.heightBox,
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: emailHintText,
                    prefixIcon: Icon(Icons.email,color: darkGrey,),
                    border: InputBorder.none,
                  ),
                ),
                20.heightBox,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: passwordHintText,
                    prefixIcon: Icon(Icons.lock,color: darkGrey,),
                    border: InputBorder.none,
                  ),
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: normalText(value: "$forgotPassword ?",color: Colors.red)),
                20.heightBox,
                SizedBox(
                  height: context.screenHeight/16,
                  width: context.screenWidth-200,
                  child: ourButton(title: login,onPress: (){
                    Get.to(()=>const Home());
                  })),
              ],
            ).box.white.p8.customRounded(BorderRadius.circular(12)).make(),
            10.heightBox,
            normalText(value: anyProblem),
          ],
        ).p16(),
      ),
    );
  }
}