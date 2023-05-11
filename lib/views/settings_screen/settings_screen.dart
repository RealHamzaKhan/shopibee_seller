import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/auth_controller.dart';
import 'package:emart_seller/controllers/profile_controller.dart';
import 'package:emart_seller/services/firestore_service.dart';
import 'package:emart_seller/views/auth_screen/login_screen.dart';
import 'package:emart_seller/views/message_screen/message_scree.dart';
import 'package:emart_seller/views/profile_screen/edit_profile.dart';
import 'package:emart_seller/views/shop_screen/shop_settings.dart';
import 'package:emart_seller/widgets/textstyles.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController=Get.put(AuthController());
    final profileController=Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        backgroundColor: purpleColor,
        title: "Settings".text.make(),
        automaticallyImplyLeading: false,
        actions: [
          const Icon(Icons.edit,size: 26,).onTap(() {Get.to(()=>const EditProfile());}),
          10.widthBox,
          Obx(()=>
          authController.isLoading.value?const CircularProgressIndicator(color: white,).centered()
          : "Logout".text.size(19).bold.make().paddingSymmetric(vertical: 15,horizontal: 10).onTap(() async{
              try{
                authController.isLoading(true);
                await authController.signoutMethod(context);
                Get.offAll(()=>const LoginScreen());
                authController.isLoading(false);
              }
              catch (e){
                authController.isLoading(false);
                VxToast.show(context, msg: "An unknown error occured");
          
              }
              
            }),
          ),
        ],
      ),
      body:FutureBuilder(
        future: FirestoreServices.getProfile(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const CircularProgressIndicator(
              color: white,
            ).centered();
          }
          else{
            profileController.snapshot=snapshot.data!.docs[0];
            return Column(
        children: [
          ListTile(
            leading: profileController.snapshot['image_url'].toString().isEmpty?const Icon(Icons.person):Image.network(profileController.snapshot['image_url']).box.roundedFull.clip(Clip.antiAlias).make(),
            title: boldText(value: profileController.snapshot['name']),
            subtitle: normalText(value: profileController.snapshot['email']),
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
      );
          }
        
      })
    );
  }
}