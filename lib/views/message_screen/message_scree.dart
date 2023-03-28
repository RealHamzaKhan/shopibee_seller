import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/message_screen/chat_screen.dart';
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Messages".text.make(),
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: List.generate(20, (index){
          return ListTile(
            onTap: (){
              Get.to(()=>const ChatScreen());
            },
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/03/27/22/05/necktie-1284463_960_720.jpg")),
            title: "Username".text.bold.make(),
            subtitle: "last Message will be shown here".text.make(),
            trailing: "12:23".text.make(),
          );
        })
      ),
    );
  }
}