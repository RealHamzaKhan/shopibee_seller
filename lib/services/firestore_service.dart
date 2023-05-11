import 'package:emart_seller/consts/const.dart';

class FirestoreServices{
  static getProfile(){
    return firestore.collection('vendors').where('uid',isEqualTo: auth.currentUser!.uid).get();
  }
}