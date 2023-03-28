import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/widgets/ourButton.dart';
import 'components/order_placed_details.dart';
class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: "Order details".text.bold.make(),
        centerTitle: false,
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ourButton(title: "Confirm Order",color: Colors.green,onPress: (){}),
      ).paddingSymmetric(horizontal: 16,vertical: 5),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            "Order Status".text.bold.size(20).make(),
            SwitchListTile(value: true, onChanged: (value){},title: "Placed".text.bold.make(),),
            SwitchListTile(value: true, onChanged: (value){},title: "Confirmed".text.bold.make(),),
            SwitchListTile(value: true, onChanged: (value){},title: "On delivery".text.bold.make(),),
            SwitchListTile(value: true, onChanged: (value){},title: "Delivered".text.bold.make(),),
            const Divider(),
            10.heightBox,
            Column(
              children: [
                orderPlacedDetails(title1: "Order Code",
                    subtitle1:" data['order_code']",
                    title2: 'Shipping Method',
                    subtutle2:"data['shipping_method']"
                ),
                orderPlacedDetails(title1: "Order Date",
                    subtitle1: "${DateTime.now()}",
                    title2: 'Payment Method',
                    subtutle2:"data['payment_method']"
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
                        "Name: {data['order_by_name']}".text.size(14).color(fontGrey).make(),
                        "Email: {data['order_by_email']}".text.size(14).color(fontGrey).make(),
                        "Address: {data['order_by_address']}".text.size(14).color(fontGrey).make(),
                        "City: {data['order_by_city']}".text.size(14).color(fontGrey).make(),
                        "Province: {data['order_by_province']}".text.size(14).color(fontGrey).make(),
                        "P#: {data['order_by_phone']}".text.size(14).color(fontGrey).make(),
                        "Postal Code : {data['order_by_postal_code']}".text.size(14).color(fontGrey).make(),

                      ],
                    ).box.width(context.screenWidth*0.5).make(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Total Amount".text.bold.size(17).make(),
                        "{data['total_amount']}".text.red400.bold.size(17).make(),
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
              children:List.generate(3, (index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "{data['orders'][index]['title']}".text.size(20).color(fontGrey).make(),
                        "X {data['orders'][index]['quantity']}".text.black.make(),
                        VxCircle(radius: 20,backgroundColor: Colors.amber),

                      ],
                    ),
                    "{data['orders'][index]['total_price']}".text.size(20).red400.make().expand(),
                  ],
                ).box.p12.white.outerShadowSm.make();
              })
            ).box.p12.white.outerShadowSm.make()
          ],
        ),
      ),
    );
  }
}
