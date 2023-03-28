import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/product_screen/product_details.dart';
import 'package:emart_seller/widgets/custom_appbar.dart';
import 'package:emart_seller/widgets/dashboard_item.dart';
import 'package:intl/intl.dart' as intl;
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Dashboard"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dashboardItem(context: context, title: "Product", count: '50', image: icProducts),
              dashboardItem(context: context, title: "Orders", count: '50', image: icOrders),

            ],
          ),
          SizedBox(height: context.screenHeight*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dashboardItem(context: context, title: "Ratings", count: '50', image: icStar),
              dashboardItem(context: context, title: "Total Sales", count: '50', image: icOrders),

            ],
          ),
          20.heightBox,
          "Popular Products".text.bold.size(18).make(),
          ListView(
            physics:const BouncingScrollPhysics(),
            //shrinkWrap: false,
            children: List.generate(
              10, (index){
              return ListTile(
                onTap: (){
                  Get.to(()=>const ProductDetails());
                },
                leading: Image.network("https://cdn.pixabay.com/photo/2016/03/27/22/05/necktie-1284463_960_720.jpg").box.clip(Clip.antiAlias).rounded.make(),
                title: "Shoes".text.make(),
                subtitle: "\$50".text.red500.make(),
              );
            }),
          ).expand()
        ],
      ).p16()
    );
  }
}