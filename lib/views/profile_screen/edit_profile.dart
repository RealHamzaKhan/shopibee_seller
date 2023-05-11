import 'dart:io';

import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/home_screen/home.dart';
import 'package:emart_seller/views/settings_screen/settings_screen.dart';
import 'package:emart_seller/widgets/custom_textform.dart';

import '../../controllers/profile_controller.dart';

class EditProfile extends StatefulWidget {
  String? username;
 EditProfile({super.key,required this.username});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var profileController=Get.find<ProfileController>();
  @override
  void initState() {

    // TODO: implement initState
    profileController.nameController.text=widget.username!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          actions: [GestureDetector(
            onTap: ()async{
              profileController.isUpdated.value=true;
                        if(profileController.profileImagePath.value.isNotEmpty){
                          try{
                            if(profileController.oldPasswordController.text==profileController.snapshot['password']){
                              await profileController.uploadProfileImage(context);
                              await profileController.changeAuthPassword(email: profileController.snapshot['email'],
                                  OldPassword: profileController.oldPasswordController.text,
                                  newPassword: profileController.newPasswordController.text);
                              await profileController.updateProfile(newName: profileController.nameController.text,
                                newPass: profileController.newPasswordController.text,
                                newImage: profileController.imageLink,
                              );
                              VxToast.show(context, msg: 'Profile Updated Successfully');
                              profileController.isUpdated.value=false;
                          profileController.imageLink='';
                          profileController.oldPasswordController.clear();
                          profileController.newPasswordController.clear();
                          Get.offAll(()=>const Home());
                            }
                            else{
                              VxToast.show(context, msg: "Wrong Old Password");
                            }
                          }
                          catch(e){
                            VxToast.show(context, msg: "Unable to update profile kindly try later");
    
                          }
                          profileController.isUpdated.value=false;
                        }
                        else{
                          try{
                            if(profileController.oldPasswordController.text==profileController.snapshot['password']) {
                              await profileController.changeAuthPassword(email: profileController.snapshot['email'],
                                  OldPassword: profileController.oldPasswordController.text,
                                  newPassword: profileController.newPasswordController.text);
                              await profileController.updateProfile(
                                newName: profileController.nameController.text,
                                newPass: profileController.newPasswordController.text,
                                newImage: profileController.snapshot['imageUrl'],
    
                              );
                              VxToast.show(context, msg: 'Profile Updated Successfully');
                              profileController.isUpdated.value=false;
                          profileController.imageLink='';
                          profileController.oldPasswordController.clear();
                          profileController.newPasswordController.clear();
                          Get.offAll(()=>const Home());
                            }
                            else{
                              VxToast.show(context, msg: "Wrong Old Password");
                            }
                           // profileController.isLoading.value=false;
                          }
                          catch(e){
                            VxToast.show(context, msg: "Unable to update profile kindly try later");
                           // controller.isLoading.value=false;
                          }
                          
                        }
                        
            },
            child: profileController.isUpdated.value?const CircularProgressIndicator(color: white,).centered():"Save".text.size(20).bold.make().p(15)),],
          automaticallyImplyLeading: true,
          title: "Edit Profile".text.make(),
        ),
        body: Column(
          children: [
            profileController.snapshot['image_url']=='' && profileController.profileImagePath.isEmpty?
                     //random pic
                     const CircleAvatar(
                      backgroundImage: NetworkImage("https://w7.pngwing.com/pngs/287/940/png-transparent-person-computer-icons-personal-miscellaneous-company-logo-thumbnail.png"),
                      radius:70,
                     )
                     :profileController.profileImagePath.isNotEmpty?
                    //file image
                    CircleAvatar(
                      backgroundImage: FileImage(File(profileController.profileImagePath.value)),
                      radius: 70,
                    )
                      :
                      CircleAvatar(
                      backgroundImage: NetworkImage(profileController.snapshot['image_url']),
                      radius: 70,
                    ),
                      //own image
            10.heightBox,
            ElevatedButton(
              onPressed: ()async {
                await profileController.changeImage(context: context);
                setState(() {
                  
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: "Change photo".text.bold.black.make(),
            ),
            10.heightBox,
            const Divider(color: Colors.white,),
            10.heightBox,
            customTextForm(hintText: "Hamza_837", label: "Username",controller: profileController.nameController),
            customTextForm(hintText: "*********", label: "Password",controller: profileController.oldPasswordController),
            customTextForm(hintText: "*********", label: "Confirm Password",controller: profileController.newPasswordController)
          ],
        ),
      ),
    );
  }
}
