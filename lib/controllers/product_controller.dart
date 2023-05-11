import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/controllers/home_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController{
  var isLoading=false.obs;
  final productNameController=TextEditingController();
  final productDescriptionController=TextEditingController();
  final productPriceController=TextEditingController();
  final productQuantityController=TextEditingController();
  var categoryList=<String>[].obs;
  var subCategoryList=<String>[].obs;
  var imagesLinks=[];
  var selectedCategory=''.obs;
  var selectedSubCategory=''.obs;
  List<Category> category=[];
  var productImagesList=RxList<dynamic>.generate(3, (index) => null);
  var selectedColorIndex=0.obs;

  getCategories()async{
    var data=await rootBundle.loadString('lib/services/category_model.json');
    var cat=categoryModelFromJson(data);
    category=cat.categories;
  }
  populateCategoryList(){
    categoryList.clear();
    for(var item in category){
      categoryList.add(item.name);
    }
  }

  populateSubCategories(cat){
    subCategoryList.clear();
    var data=category.where((element) => element.name==cat);
    for(var i=0;i<data.first.subcategory.length;i++){
      subCategoryList.add(data.first.subcategory[i]);
    }
  }

  pickImages({context,index})async {
    try{
      final img=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 80);
    if(img==null){
      return;
    }
    else{
      productImagesList[index]=File(img.path);
    }
    }
    catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImages(context)async{
    isLoading(true);
    imagesLinks.clear();
    try{
      for(var item in productImagesList){
         var filename=basename(item.path);
          var destination="Images/vendors/${auth.currentUser!.uid}/$filename";
          Reference reference=storage.ref().child(destination);
          await reference.putFile(item);
          var n=await reference.getDownloadURL();
          imagesLinks.add(n);
          
      }
      productImagesList.clear();
    }
    catch (e){
      VxToast.show(context, msg: "Error occured while uploading images");
    }
  }

  saveProduct(context)async{
    try{
      await firestore.collection(productCollection).doc().set({
      'is_featured':false,
      'p_category':selectedCategory.value,
      'p_colors':FieldValue.arrayUnion([Colors.red.value.toString(),Colors.black.value.toString(),Colors.white.value.toString()]),
      'p_desc':productDescriptionController.text,
      'p_images':FieldValue.arrayUnion(imagesLinks),
      'p_name':productNameController.text,
      'p_price':productPriceController.text.toString(),
      'p_quantity':productQuantityController.text.toString(),
      'p_rating':'5.0',
      'p_seller':Get.find<HomeController>().userName,
      'p_subcategory':selectedSubCategory.value,
      'p_wishlist':FieldValue.arrayUnion([]),
      'vendor_id':user!.uid,
      'featured_id':''
    });
    imagesLinks.clear();
    productImagesList.clear();
    productNameController.clear();
    productDescriptionController.clear();
    productPriceController.clear();
    productQuantityController.clear();
    selectedCategory.value='';
    selectedSubCategory.value='';
    isLoading(false);
    VxToast.show(context, msg: "Product Upload Successfully");
    
    }
    catch (e){
      VxToast.show(context, msg: "Error occured while adding product");
    }
    
    
    
    
  }
  addFeature(docId)async{
  await firestore.collection(productCollection).doc(docId).update({
    'is_featured':true
  });
  }
 removeFeature(docId)async{
  await firestore.collection(productCollection).doc(docId).update({
    'is_featured':false
  });
  }

  deleteProduct(context,docId)async{
    try{
      await firestore.collection(productCollection).doc(docId).delete();
      VxToast.show(context, msg: "Product deleted succesfuly");
    }
    catch(e){
      VxToast.show(context, msg: "Unable to delete.\n Try again later");
    }
    
  }



}