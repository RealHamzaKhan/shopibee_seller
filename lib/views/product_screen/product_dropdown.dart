import 'package:emart_seller/consts/const.dart';
Widget productDropDown({title}){
  return DropdownButtonHideUnderline(child: DropdownButton<String>(
    items: const [],
    onChanged: (value){},
    value: null,
    hint: "$title".text.make(),
    isExpanded: true,
  )
  ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 8)).make();
}