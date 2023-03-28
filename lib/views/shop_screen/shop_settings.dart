import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/widgets/custom_textform.dart';
class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: "Shop Settings".text.make(),
        actions: ["Save".text.size(20).bold.make().p(15)],
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          customTextForm(hintText: "Shop Name", label: "Shop Name"),
          customTextForm(hintText: "Shop Adress", label: "Shop Address"),
          customTextForm(hintText: "Shop Mobile", label: "Shop Mobile"),
          customTextForm(hintText: "Shop Website", label: "Shop Website"),
          customTextForm(hintText: "Description", label: "Shop Description",isDescription: true),
          
        ],
      ),
    );
  }
}