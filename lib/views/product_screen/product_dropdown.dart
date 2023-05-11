import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/product_controller.dart';
Widget productDropDown(title,List<String> list,dropdownValue,ProductController controller){
  return Obx(()=>
     DropdownButtonHideUnderline(
      child: DropdownButton(
      items: list.map((e) {
        return DropdownMenuItem(value: e,child: e.toString().text.make(),
        );
      }).toList(),
      onChanged: (newValue){
        if(title=="Choose category"){
          controller.selectedSubCategory.value='';
          controller.populateSubCategories(newValue.toString());
        }
        dropdownValue.value=newValue.toString();
      },
      value:dropdownValue.value==''? null:dropdownValue.value,
      hint: "$title".text.make(),
      isExpanded: true,
    )
    ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 8)).make(),
  );
}