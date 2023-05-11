import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class ProfileController extends GetxController{
  late QueryDocumentSnapshot snapshot;
 var profileImagePath=''.obs;
 final oldPasswordController=TextEditingController();
 final nameController=TextEditingController();
 final newPasswordController=TextEditingController();
 //shop controllers
 final shopNameController=TextEditingController();
 final shopAddressController=TextEditingController();
 final shopMobileController=TextEditingController();
 final shopWebsiteController=TextEditingController();
 final shopDescriptionController=TextEditingController();
 String imageLink='';
 var isUpdated=false.obs;
 changeImage({context})async{
  try{
   final image=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
   if(image==null){return;}
   profileImagePath.value=image.path;
  }
  catch(e){
   VxToast.show(context, msg: "Unknown error occurred");
  }

 }
 Future<void> uploadProfileImage(context)async{
  try{
   var filename=basename(profileImagePath.value);
   var destination="Images/${auth.currentUser!.uid}/$filename";
   Reference reference=storage.ref().child(destination);
   await reference.putFile(File(profileImagePath.value));
   imageLink=await reference.getDownloadURL();
  }
  catch(e){
   VxToast.show(context, msg: "Unable to upload image");
  }
 }
 updateProfile({required String newName,required String newPass,required String newImage})async{
  // await user!.updateEmail(newEmail);
  // await user!.updatePassword(newPass);
  await firestore.collection(vendors).doc(user!.uid).update({
   'name':newName,
   'password':newPass,
   'image_url':newImage
  });
  isUpdated(false);
 }
 changeAuthPassword({required String email,required String OldPassword,required String newPassword})async{
  final cred=EmailAuthProvider.credential(email: email, password: OldPassword);
  await user!.reauthenticateWithCredential(cred).then((value) {
   user!.updatePassword(newPassword);
  }).catchError((error){
   log('Unable to Update password');
  });
 }
 updateShop()async{
  await firestore.collection(vendors).doc(user!.uid).update({
    'shop_name':shopNameController.text,
    'shop_address':shopAddressController.text,
    'shop_mobile':shopMobileController.text,
    'shop_website':shopWebsiteController.text,
    'shop_description':shopDescriptionController.text,
  });
 }
}