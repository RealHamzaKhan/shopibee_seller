import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/order_controller.dart';
import 'package:emart_seller/services/firestore_service.dart';
import 'package:emart_seller/views/orders_screen/order_details.dart';
import 'package:emart_seller/widgets/custom_appbar.dart';
import 'package:emart_seller/widgets/textstyles.dart';
import 'package:intl/intl.dart' as intl;
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OrderController());
    return Scaffold(
      appBar: customAppBar(title: "Orders"),
      body: StreamBuilder(
        stream: FirestoreServices.getOrders(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const CircularProgressIndicator(color: purpleColor,).centered();
          }
          else if(snapshot.data!.docs.isEmpty){
            return "No Orders yet !".text.bold.size(20).make().centered();
          }
          else{
            var snap=snapshot.data!.docs;
           return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: List.generate(snap.length, (index){
              return ListTile(
                onTap: (){
                  Get.to(()=> OrderDetails(data: snap[index],));
                },
                trailing: boldText(value: "${snap[index]['total_amount']}",color: Vx.red400,size: 20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                tileColor: lightGrey,
                title: boldText(value: "${snap[index]['order_code']}",color: Colors.black),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        normalText(value: intl.DateFormat.yMMMd().format(snap[index]['order_date'].toDate()),color: darkGrey)
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
           );
          }
      })
    );
  }
}