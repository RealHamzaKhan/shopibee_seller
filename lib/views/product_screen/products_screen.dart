import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/product_controller.dart';
import 'package:emart_seller/services/firestore_service.dart';
import 'package:emart_seller/views/product_screen/add_product.dart';
import 'package:emart_seller/views/product_screen/product_details.dart';
import 'package:emart_seller/widgets/custom_appbar.dart';
import 'package:emart_seller/widgets/popupmenu_item.dart';
import 'package:emart_seller/widgets/textstyles.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final popupController=VxPopupMenuController();
    var controller=Get.put(ProductController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await controller.getCategories();
          controller.populateCategoryList();
          Get.to(()=>const AddProduct());
        },
        backgroundColor: purpleColor,
        child: const Icon(Icons.add),
      ),
      appBar: customAppBar(title: products),
      body: StreamBuilder(
        stream: FirestoreServices.getProducts(),
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(!snapshot.hasData){
          return const CircularProgressIndicator(color: purpleColor,).centered();
        }
        else if(snapshot.data!.docs.isEmpty){
          return "No products".text.bold.size(20).color(textfieldGrey).make().centered();
        }
        else{
          return ListView(
        physics: const BouncingScrollPhysics(),
            children: List.generate(
              snapshot.data!.docs.length, (index){
                var snap=snapshot.data!.docs[index];
              return ListTile(
                onTap: () => Get.to(()=> ProductDetails(snap: snap,)),
                leading: Image.network(snap['p_images'][0],fit: BoxFit.cover,).box.width(context.screenWidth*0.2).clip(Clip.antiAlias).rounded.make(),
                title: "${snap['p_name']}".text.make(),
                subtitle: Row(
                  children: [
                    "${snap['p_price']}".text.red500.make(),
                    5.widthBox,
                    snap['is_featured']?normalText(value:"Featured",color: green)
                    :Container(),
                  ],
                ),
                trailing: VxPopupMenu(
                  controller:popupController ,
                  clickType: VxClickType.singleClick,
                menuBuilder: () => Column(
                  children:List.generate(popUpMenuIcons.length, (i) =>Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      popUpMenuIcons[i],
                      10.widthBox,
                      popUpMenuTitles[i].text.bold.size(18).make(),
                    ],
                  ).paddingSymmetric(vertical: 10).onTap(() async{
                    switch(i){
                      case 0:
                      if(snap['is_featured']==true){
                        popupController.hideMenu();
                        await controller.removeFeature(snap.id);
                        
                      }
                      else{
                        popupController.hideMenu();
                        await controller.addFeature(snap.id);
                        
                      }
                      break;
                      case 1:
                      popupController.hideMenu();
                      await controller.deleteProduct(context, snap.id);
                      break;
                    }
                    popupController.hideMenu();
                  }) ),
                ).box.white.roundedSM.p12.width(context.screenWidth*0.4).make(),child: const Icon(Icons.more_vert),
                ),
              );
            }),
          );
        }
      })
    );
  }
}