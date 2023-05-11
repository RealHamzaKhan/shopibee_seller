import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/product_controller.dart';
import 'package:emart_seller/views/product_screen/components/image_container.dart';
import 'package:emart_seller/views/product_screen/product_dropdown.dart';
import 'package:emart_seller/widgets/custom_textform.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return Obx(()=>
      Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          actions: [
            controller.isLoading.value?const CircularProgressIndicator(color: Colors.white,).centered():"Save".text.bold.size(20).make().p16().onTap(() async{
              await controller.uploadImages(context);
              // ignore: use_build_context_synchronously
              await controller.saveProduct(context);
              Get.back();
            })
          ],
          title: "Add product".text.make(),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextForm(
                  hintText: "e.g Children soap", label: "Product name",controller: controller.productNameController),
              customTextForm(
                  hintText:
                      "e.g Anti bacterial soap for children that helps......",
                  label: "Description",
                  isDescription: true,controller: controller.productDescriptionController),
              customTextForm(hintText: "e.g \$200", label: "Price",controller: controller.productPriceController,isNumber: true),
              customTextForm(hintText: "e.g 50", label: "Quantity",controller: controller.productQuantityController,isNumber: true),
              10.heightBox,
              productDropDown("Choose category",controller.categoryList,controller.selectedCategory,controller)
                  .paddingSymmetric(horizontal: 8),
              10.heightBox,
              productDropDown("Choose subcategory",controller.subCategoryList,controller.selectedSubCategory,controller)
                  .paddingSymmetric(horizontal: 8),
              10.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Choose images".text.bold.size(20).white.make(),
                  10.heightBox,
                  Obx(()=>
                     Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(3, (index) {
                       return controller.productImagesList[index]!=null?Image.file(controller.productImagesList[index],fit: BoxFit.cover,).box.width(context.screenWidth*0.3).roundedSM.clip(Clip.antiAlias).make().onTap(() {
                        controller.pickImages(context: context,index: index);
                       }):
                        imageContainer(
                            title: "${index + 1}", context: context).onTap(() {
                              controller.pickImages(context: context,index: index);
                            });
                      }),
                    ),
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
                          return Obx(()=>
                            Stack(
                              alignment: Alignment.center,
                              children: [
                               CircleAvatar(
                                radius: 25,
                                backgroundColor: Vx.randomColor,
                               ).onTap(() {
                                controller.selectedColorIndex.value=index;
                               }),
                               index==controller.selectedColorIndex.value?
                               const Icon(Icons.check,color: Colors.white,):const SizedBox()
                              ],
                            ),
                          );
                        }),
                      )
                ],
              ).p8(),
            ],
          ),
        ),
      ),
    );
  }
}
