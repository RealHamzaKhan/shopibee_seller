import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/home_controller.dart';
import 'package:emart_seller/views/home_screen/homescreen.dart';
import 'package:emart_seller/views/orders_screen/orders_screen.dart';
import 'package:emart_seller/views/product_screen/products_screen.dart';
import 'package:emart_seller/views/settings_screen/settings_screen.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeController());
    var bottomNavBar=[
      const BottomNavigationBarItem(icon: Icon(Icons.dashboard,color: darkGrey,size: 24,),label: dashboard),
      BottomNavigationBarItem(icon: Image.asset(icProducts,width: 24,color: darkGrey,),label: products),
      BottomNavigationBarItem(icon: Image.asset(icOrders,width: 24,color: darkGrey,),label: orders),
      BottomNavigationBarItem(icon: Image.asset(icGeneralSetting,width: 24,color: darkGrey,),label: setting),
    ];
    var navViews=const[
      HomeScreen(),
      ProductScreen(),
      OrdersScreen(),
      SettingsScreen(),

    ];
    return Scaffold(
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          onTap: (index){
            controller.screenIndex.value=index;
          },
          currentIndex: controller.screenIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          elevation: 0.0,
          items: bottomNavBar),
      ),
        body: Obx(()=>
           Column(
            children: [
              Expanded(child: navViews.elementAt(controller.screenIndex.value))
            ],
          ),
        ),
    );
  }
}