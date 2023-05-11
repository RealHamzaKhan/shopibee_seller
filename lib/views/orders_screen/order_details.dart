import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/order_controller.dart';
import 'package:emart_seller/widgets/ourButton.dart';
import 'components/order_placed_details.dart';
import 'package:intl/intl.dart' as intl;
class OrderDetails extends StatefulWidget {
  dynamic data;
 OrderDetails({Key? key,required this.data}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final controller=Get.find<OrderController>();
  @override
  void initState() {
    controller.getOrders(widget.data);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: "Order details".text.bold.make(),
          centerTitle: false,
        ),
        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value,
          child: SizedBox(
            height: 50,
            child: ourButton(title: "Confirm Order",color: Colors.green,onPress: (){
              controller.confirmed.value=true;
              controller.changeStatus(title: "order_confirm",status: true,docId: widget.data.id);
            }),
          ).paddingSymmetric(horizontal: 16,vertical: 5),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              "Order Status".text.bold.size(20).make(),
              SwitchListTile(activeColor: purpleColor,value: true, onChanged: (value){},title: "Placed".text.bold.make(),),
              SwitchListTile(activeColor: purpleColor,value: controller.confirmed.value, onChanged: (value){
                controller.confirmed.value=value;
                 controller.changeStatus(title: "order_confirm",status: value,docId: widget.data.id);
              },title: "Confirmed".text.bold.make(),),
              SwitchListTile(activeColor: purpleColor,value: controller.ondelivery.value, onChanged: (value){
                controller.ondelivery.value=value;
                controller.changeStatus(title: "order_on_delivery",status: value,docId: widget.data.id);
              },title: "On delivery".text.bold.make(),),
              SwitchListTile(activeColor: purpleColor,value: controller.delivered.value, onChanged: (value){
                controller.delivered.value=value;
                controller.changeStatus(title: "order_delivered",status: value,docId: widget.data.id);
              },title: "Delivered".text.bold.make(),),
              const Divider(),
              10.heightBox,
              Column(
                children: [
                  orderPlacedDetails(title1: "Order Code",
                      subtitle1:"${widget.data['order_code']}",
                      title2: 'Shipping Method',
                      subtutle2:"${widget.data['shipping_method']}"
                  ),
                  orderPlacedDetails(title1: "Order Date",
                      subtitle1: "${intl.DateFormat.yMMMd().format(widget.data['order_date'].toDate())}",
                      title2: 'Payment Method',
                      subtutle2:"${widget.data['payment_method']}"
                  ),
                  orderPlacedDetails(title1: "Payment Status",
                      subtitle1: "Unpaid",
                      title2: 'Delivery Status',
                      subtutle2:"Complete"
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Shipping Address".text.bold.size(17).make(),
                          "Name: ${widget.data['order_by_name']}".text.size(14).color(fontGrey).make(),
                          "Email: ${widget.data['order_by_email']}".text.size(14).color(fontGrey).make(),
                          "Address: ${widget.data['order_by_address']}".text.size(14).color(fontGrey).make(),
                          "City: ${widget.data['order_by_city']}".text.size(14).color(fontGrey).make(),
                          "Province: ${widget.data['order_by_province']}".text.size(14).color(fontGrey).make(),
                          "P#: ${widget.data['order_by_phone']}".text.size(14).color(fontGrey).make(),
                          "Postal Code : ${widget.data['order_by_postal_code']}".text.size(14).color(fontGrey).make(),
    
                        ],
                      ).box.width(context.screenWidth*0.5).make(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Total Amount".text.bold.size(17).make(),
                          "${widget.data['total_amount']}".text.red400.bold.size(17).make(),
                        ],
                      ).box.width(150).make()
                    ],
                  ).paddingAll(10)
                ],
              ).box.white.outerShadowSm.make(),
              10.heightBox,
              "Ordered Products".text.bold.size(20).make(),
              10.heightBox,
              Column(
                children:List.generate(controller.orders.length, (index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${controller.orders[index]['title']}".text.size(20).color(fontGrey).make(),
                          "X ${controller.orders[index]['quantity']}".text.black.make(),
                          VxCircle(radius: 20,backgroundColor: Color(int.parse(controller.orders[index]['color']))),
    
                        ],
                      ),
                      const Spacer(),
                      "${controller.orders[index]['total_price']}".text.size(20).red400.make()
                    ],
                  ).box.p12.white.outerShadowSm.make();
                })
              ).box.p12.white.outerShadowSm.make()
            ],
          ),
        ),
      ),
    );
  }
}
