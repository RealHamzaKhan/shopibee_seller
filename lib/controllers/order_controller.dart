import 'package:emart_seller/consts/const.dart';
class OrderController extends GetxController{
  var confirmed=false.obs;
  var delivered=false.obs;
  var ondelivery=false.obs;
  var orders=[];
  getOrders(data){
    for(var i in data['orders']){
      if(i['vendor_id']==auth.currentUser!.uid){
        orders.add(i);
      }
    }
  }
  void changeStatus({title,status,docId})async{
    await firestore.collection(ordersCollection).doc(docId).update({
      title:status
    });
  }
}