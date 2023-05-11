import  'package:emart_seller/consts/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthController extends GetxController {
  var isLoading=false.obs;
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  Future<UserCredential?> loginMethod(
      {required context}) async {
    UserCredential? userCredential;
    try {
      userCredential =
      await auth.signInWithEmailAndPassword(email: emailController.text,
          password: passwordController.text);
    }
    on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  

  
  signoutMethod(context)async{
    try{
      await auth.signOut();
    }
    catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }

}