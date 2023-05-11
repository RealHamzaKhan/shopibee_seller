import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/profile_controller.dart';
import 'package:emart_seller/views/home_screen/home.dart';
import 'package:emart_seller/widgets/custom_textform.dart';
class ShopSettings extends StatefulWidget {
  const ShopSettings({super.key});

  @override
  State<ShopSettings> createState() => _ShopSettingsState();
}

class _ShopSettingsState extends State<ShopSettings> {
  final controller=Get.find<ProfileController>();
  @override
  void initState() {
    // TODO: implement initState
    controller.shopNameController.text=controller.snapshot['shop_name'];
    controller.shopAddressController.text=controller.snapshot['shop_address'];
    controller.shopMobileController.text=controller.snapshot['shop_mobile'];
    controller.shopWebsiteController.text=controller.snapshot['shop_website'];
    controller.shopDescriptionController.text=controller.snapshot['shop_description'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
     Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: "Shop Settings".text.make(),
          actions: [GestureDetector(
            onTap: ()async{
              controller.isUpdated(true);
              try{
                await controller.updateShop();
                VxToast.show(context, msg: "Shop settings updated");
                Get.offAll(()=>const Home());
              }
              catch(e){
                VxToast.show(context, msg: "Unable to update");
              }
              controller.isUpdated(false);
            },
            child: controller.isUpdated.value?const CircularProgressIndicator(color: white,).centered()
            :"Save".text.size(20).bold.make().p(15))],
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            customTextForm(hintText: "Shop Name", label: "Shop Name",controller: controller.shopNameController),
            customTextForm(hintText: "Shop Adress", label: "Shop Address",controller: controller.shopAddressController),
            customTextForm(hintText: "Shop Mobile", label: "Shop Mobile",isNumber: true,controller: controller.shopMobileController),
            customTextForm(hintText: "Shop Website", label: "Shop Website",controller: controller.shopWebsiteController),
            customTextForm(hintText: "Description", label: "Shop Description",isDescription: true,controller: controller.shopDescriptionController),
            
          ],
        ),
      ),
    );
  }
}