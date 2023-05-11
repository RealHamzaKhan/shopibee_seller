import 'dart:developer';

import 'package:emart_seller/consts/const.dart';

class FirestoreServices{
  static getProfile(){
    return firestore.collection('vendors').where('uid',isEqualTo: auth.currentUser!.uid).get();
  }
  static getMessages(){
    return firestore.collection(chatsCollection).where('to_id',isEqualTo: user!.uid).snapshots();
  }
  static Future<String> getProfilePic({uid}){
    return firestore.collection('users').where('uid',isEqualTo: uid).get().then((value) {
      return value.docs[0]['imageUrl'];
    });
  }
  static getOrders(){
    return firestore.collection(ordersCollection).where('vendors',arrayContains:auth.currentUser!.uid).snapshots();
  }
  static getProducts(){
    return firestore.collection(productCollection).where('vendor_id',isEqualTo: user!.uid).snapshots();
  }
  static getProductCount(){
    return firestore.collection(productCollection).where('vendor_id',isEqualTo: user!.uid).get().then((value){
      if(value.docs.isNotEmpty){
        debugPrint(value.docs.length.toString());
        return value.docs.length.toString();
      }
      else{
        return "0";
      }
    });
  
  }
  static getOrdersCount(){
    return firestore.collection(ordersCollection).where('vendors',arrayContains: user!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.length.toString();
      }
      else{
        return '0';
      }
    });
  }
  static getRatingsCount(){
    double count=0.0;
    return firestore.collection(productCollection).where('vendor_id',isEqualTo: user!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        for(int i=0;i<value.docs.length;i++){
          count+=double.parse(value.docs[i].data()['p_rating']);
        }
        count= count/value.docs.length.toDouble();
        return count.toStringAsFixed(1);
      }
      else{
        return '0';
      }
    });
  }
  static getSalesCount(){
    return firestore.collection(ordersCollection).where('vendors',arrayContains: user!.uid).where('order_delivered',isEqualTo: true).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.length.toString();
      }
      else{
        return '0';
      }
    });
  }
  static getPopularProducts(){
    return firestore.collection(productCollection).orderBy('p_wishlist',descending: true).snapshots();
}
static getMessagesStream(docId){
  return firestore.collection(chatsCollection).doc(docId).collection('messages').orderBy('created_on',descending: false).snapshots();
}
}