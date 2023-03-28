import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/product_screen/components/image_container.dart';
import 'package:emart_seller/views/product_screen/product_dropdown.dart';
import 'package:emart_seller/widgets/custom_textform.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        actions: [
          "Save".text.bold.size(20).make().p16()
        ],
        title: "Add product".text.make(),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextForm(
                hintText: "e.g Children soap", label: "Product name"),
            customTextForm(
                hintText:
                    "e.g Anti bacterial soap for children that helps......",
                label: "Description",
                isDescription: true),
            customTextForm(hintText: "e.g \$200", label: "Price"),
            customTextForm(hintText: "e.g 50", label: "Quantity"),
            10.heightBox,
            productDropDown(title: "Choose category")
                .paddingSymmetric(horizontal: 8),
            10.heightBox,
            productDropDown(title: "Choose subcategory")
                .paddingSymmetric(horizontal: 8),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Choose images".text.bold.size(20).white.make(),
                10.heightBox,
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(4, (index) {
                    return imageContainer(
                        title: "${index + 1}", context: context);
                  }),
                ),
                5.heightBox,
                "Note : First image will be used as a display image"
                    .text
                    .white
                    .size(10)
                    .make(),
                    10.heightBox,
                    "Choose Colors".text.bold.size(20).white.make(),
                    10.heightBox,
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: List.generate(10, (index){
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                           CircleAvatar(
                            radius: 25,
                            backgroundColor: Vx.randomColor,
                           ),
                           Icon(Icons.check,color: Colors.white,),
                          ],
                        );
                      }),
                    )
              ],
            ).p8(),
          ],
        ),
      ),
    );
  }
}
