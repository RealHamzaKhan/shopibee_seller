import 'package:emart_seller/consts/const.dart';

import '../services/firestore_service.dart';

class HomeController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    getUsername();
    super.onInit();
  }
  var screenIndex=0.obs;
  var userName='';
  var productCount='0'.obs;
  var ordersCount='0'.obs;
  var ratings='0'.obs;
  var salesCount='0'.obs;
  getUsername()async{
    String n=await firestore.collection(vendors).where('uid',isEqualTo: user!.uid).get().then((value){
      if(value.docs.isEmpty){
        return '';
      }
      else{
        return value.docs.single['name'];
      }
    });
    userName=n;
  }
  productsCount()async{
   productCount.value= await FirestoreServices.getProductCount();
  }
  getOrdersCount()async{
   ordersCount.value= await FirestoreServices.getOrdersCount();
  }
  ratingsCount()async{
   ratings.value= await FirestoreServices.getRatingsCount();
  }
  getSalesCount()async{
   salesCount.value= await FirestoreServices.getSalesCount();
  }
}