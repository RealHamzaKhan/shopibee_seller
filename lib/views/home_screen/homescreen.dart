import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/home_controller.dart';
import 'package:emart_seller/services/firestore_service.dart';
import 'package:emart_seller/views/product_screen/product_details.dart';
import 'package:emart_seller/widgets/custom_appbar.dart';
import 'package:emart_seller/widgets/dashboard_item.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final controller;
  @override
  void initState() {
    // TODO: implement initState
     controller=Get.find<HomeController>();
     controller.ratingsCount();
     controller.getOrdersCount();
     controller.productsCount();
     controller.getSalesCount();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: customAppBar(title: "Dashboard"),
      body: Obx(()=>
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardItem(context: context, title: "Product", count: controller.productCount.value, image: icProducts),
                dashboardItem(context: context, title: "Orders", count: controller.ordersCount.value, image: icOrders),
      
              ],
            ),
            SizedBox(height: context.screenHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardItem(context: context, title: "Ratings", count: controller.ratings.value, image: icStar),
                dashboardItem(context: context, title: "Total Sales", count: controller.salesCount.value, image: icOrders),
      
              ],
            ),
            20.heightBox,
            "Popular Products".text.bold.size(18).make(),
            StreamBuilder(
              stream: FirestoreServices.getPopularProducts(),
              builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if(!snapshot.hasData){
                  return const CircularProgressIndicator(color: purpleColor,).centered();
                }
                if(snapshot.data!.docs.isEmpty){
                  return "No products".text.bold.size(20).color(textfieldGrey).make();
                }
                else{
                  return ListView(
              physics:const BouncingScrollPhysics(),
              //shrinkWrap: false,
              children: List.generate(
                snapshot.data!.docs.length, (index){
                  var snap=snapshot.data!.docs[index];
                return ListTile(
                  onTap: (){
                    Get.to(()=> ProductDetails());
                  },
                  leading: Image.network(snap['p_images'][0]).box.clip(Clip.antiAlias).rounded.make(),
                  title: "${snap['p_name']}".text.make(),
                  subtitle: "${snap['p_price']}".text.red500.make(),
                );
              }),
            ).expand();
                }
              
            })
          ],
        ).p16(),
      )
    );
  }
}