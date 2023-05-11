import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/auth_screen/login_screen.dart';
import 'package:emart_seller/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkUser();
    // TODO: implement initState
    super.initState();
  }
  bool isLoggedin=false;
  void checkUser()async{
     auth.authStateChanges().listen((User? user) {
      if(user==null && mounted){
        
        Future.delayed(const Duration(seconds: 3),(){
          Get.offAll(const LoginScreen());
        });
      }
      else{
        
        Future.delayed(const Duration(seconds: 3),(){
          Get.offAll(const Home());
        });
      }
      
     });
     
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ShopiBee Seller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        )
      ),
      home: Scaffold(
        body:Image.asset('assets/splash_screen.png',fit: BoxFit.fill,).box.size( double.infinity,double.infinity).make() ,
      ),
    );
  }
}


