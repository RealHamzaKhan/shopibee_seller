import 'package:emart_seller/consts/const.dart';

Widget customTextForm({required String hintText,required String label,bool isDescription=false,controller,
isNumber=false
}){
  return TextFormField(
    keyboardType: isNumber?TextInputType.number:TextInputType.streetAddress,
    controller: controller,
    maxLines: isDescription?4:1,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: darkGrey
              ),
              label: label.text.color(lightGrey).make(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: Colors.purple.withOpacity(0.5)),
              ),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: Colors.purple.withOpacity(0.5)),
              ),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
             borderSide:  const BorderSide(color: Colors.purple),
              ),
              isDense: true,
            ),
          ).p8();
}