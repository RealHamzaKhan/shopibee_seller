import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/product_screen/add_product.dart';
import 'package:emart_seller/views/product_screen/product_details.dart';
import 'package:emart_seller/widgets/custom_appbar.dart';
import 'package:emart_seller/widgets/popupmenu_item.dart';
import 'package:emart_seller/widgets/textstyles.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=>const AddProduct());
        },
        backgroundColor: purpleColor,
        child: const Icon(Icons.add),
      ),
      appBar: customAppBar(title: products),
      body: ListView(
        physics: const BouncingScrollPhysics(),
            children: List.generate(
              10, (index){
              return ListTile(
                onTap: () => Get.to(()=>const ProductDetails()),
                leading: Image.network("https://cdn.pixabay.com/photo/2016/03/27/22/05/necktie-1284463_960_720.jpg").box.clip(Clip.antiAlias).rounded.make(),
                title: "Shoes".text.make(),
                subtitle: Row(
                  children: [
                    "\$50".text.red500.make(),
                    5.widthBox,
                    normalText(value: "Featured",color: green)
                  ],
                ),
                trailing: VxPopupMenu(child: Icon(Icons.more_vert),
                clickType: VxClickType.singleClick,
                menuBuilder: () => Column(
                  children: [
                    popupmenuItem(icon: Icons.edit, title: "Edit", ontap: (){}),
                    popupmenuItem(icon: Icons.delete, title: "Delete", ontap: (){}),
                    popupmenuItem(icon: Icons.featured_play_list, title: "Featured", ontap: (){}),

                  ],
                ).box.white.roundedSM.p12.width(context.screenWidth*0.4).make(),
                ),
              );
            }),
          )
    );
  }
}