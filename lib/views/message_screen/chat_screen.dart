import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/controllers/chats_controller.dart';
import 'package:emart_seller/services/firestore_service.dart';
import 'package:emart_seller/views/message_screen/components/message_bubble.dart';
class ChatScreen extends StatelessWidget {
  
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: "${controller.friendName}".text.make(),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child:StreamBuilder(
              stream: FirestoreServices.getMessagesStream(controller.chatDocId),
              builder: (context, AsyncSnapshot<QuerySnapshot>snapshot){
                if(!snapshot.hasData){
                  return const CircularProgressIndicator(color: purpleColor,).centered();
                }
                else if (snapshot.data!.docs.isEmpty){
                  return "NO MESSAGES".text.bold.size(20).color(textfieldGrey).make();
                }
                else{
                 
                 return  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
            children: List.generate(
              snapshot.data!.docs.length, (index) {
                
                var snap=snapshot.data!.docs[index];
                var isSender=snap['uid']==user!.uid?true:false;
              return messageBubble(isSender: isSender,data: snap);
            }),
          ));
                }
              },)),
          TextFormField(
            maxLines: null,
            controller: controller.messageController,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: Icon(Icons.send).onTap(() async{
                await controller.sendMsg(msg: controller.messageController.text);
                controller.messageController.clear();
              }),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: textfieldGrey)
              ),
            ),
          )
        ],
      ).p12(),
    );
  }
}