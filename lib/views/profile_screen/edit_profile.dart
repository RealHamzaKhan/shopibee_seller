import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/widgets/custom_textform.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        actions: ["Save".text.size(20).bold.make().p(15)],
        automaticallyImplyLeading: true,
        title: "Edit Profile".text.make(),
      ),
      body: Column(
        children: [
          Image.network(
            "https://cdn.pixabay.com/photo/2016/03/27/22/05/necktie-1284463_960_720.jpg",
            fit: BoxFit.fill,
            width: context.screenWidth * 0.5,
          ).box.roundedFull.clip(Clip.antiAlias).make(),
          10.heightBox,
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: "Change photo".text.bold.black.make(),
          ),
          10.heightBox,
          const Divider(color: Colors.white,),
          10.heightBox,
          customTextForm(hintText: "Hamza_837", label: "Username"),
          customTextForm(hintText: "*********", label: "Password"),
          customTextForm(hintText: "*********", label: "Confirm Password")
        ],
      ),
    );
  }
}
