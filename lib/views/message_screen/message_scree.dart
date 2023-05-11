import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/services/firestore_service.dart';
import 'package:emart_seller/views/message_screen/chat_screen.dart';
import 'package:intl/intl.dart' as intl;
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Messages".text.make(),
          automaticallyImplyLeading: true,
          foregroundColor: Colors.black,
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getMessages(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator(
                color: purpleColor,
              ).centered();
            } else if (snapshot.data!.docs.isEmpty) {
              return "No Chats".text.bold.color(textfieldGrey).size(25).makeCentered();
            } else {
              return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(snapshot.data!.docs.length, (index) {
                    var snap = snapshot.data!.docs[index];
                    var t=intl.DateFormat('h:mm a').format(snap['created_on'].toDate());
                    return ListTile(
                      onTap: () {
                        Get.to(() =>  ChatScreen(),arguments: [
                          snap['to_id'],snap['friend_name']
                        ]);
                      },
                      leading: const CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.person),),
                      title: "${snap['friend_name']}".text.bold.make(),
                      subtitle: "${snap['last_message']}".text.make(),
                      trailing: "$t".text.make(),
                    );
                  }));
            }
          },
        ));
  }
}
