import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/message_screen/message_scree.dart';
import 'package:emart_seller/views/profile_screen/edit_profile.dart';
import 'package:emart_seller/views/shop_screen/shop_settings.dart';
import 'package:emart_seller/widgets/popupmenu_item.dart';
import 'package:emart_seller/widgets/textstyles.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        backgroundColor: purpleColor,
        title: "Settings".text.make(),
        automaticallyImplyLeading: false,
        actions: [
          const Icon(Icons.edit,size: 26,).onTap(() {Get.to(()=>const EditProfile());}),
          10.widthBox,
          "Logout".text.size(19).bold.make().paddingSymmetric(vertical: 15,horizontal: 10),
        ],
      ),
      body:Column(
        children: [
          ListTile(
            leading: Image.network("https://cdn.pixabay.com/photo/2016/03/27/22/05/necktie-1284463_960_720.jpg").box.roundedFull.clip(Clip.antiAlias).make(),
            title: boldText(value: "Vendor Name"),
            subtitle: normalText(value: "zeeshankhan6669@gmail.com"),
          ),
          10.heightBox,
          const Divider(color: white,),
          10.heightBox,
          ListTile(
            onTap: (){
              Get.to(()=>const ShopSettings());
            },
            leading: const Icon(Icons.settings,color: Colors.white,),
            title: "Shop settings".text.white.make(),
          ),
           ListTile(
            onTap: (){
              Get.to(()=>const MessageScreen());
            },
            leading: const Icon(Icons.message,color: Colors.white,),
            title: "Messages".text.white.make(),
          ),
        ],
      )
    );
  }
}