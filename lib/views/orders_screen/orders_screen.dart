import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/home_screen/home.dart';
import 'package:emart_seller/views/message_screen/message_scree.dart';
import 'package:emart_seller/views/orders_screen/order_details.dart';
import 'package:emart_seller/widgets/custom_appbar.dart';
import 'package:emart_seller/widgets/textstyles.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Orders"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: List.generate(20, (index){
              return ListTile(
                onTap: (){
                  Get.to(()=> OrderDetails());
                },
                trailing: boldText(value: "\$20",color: Vx.red400,size: 20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                tileColor: lightGrey,
                title: boldText(value: "782137819723981738",color: Colors.black),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        normalText(value: "12/12/2023",color: darkGrey)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.payment),
                        boldText(value: "Unpaid",color: Vx.red600),
                      ],
                    )
                  ],
                ),
              ).paddingSymmetric(vertical: 5);
            }),
          )
        ],
      )
    );
  }
}