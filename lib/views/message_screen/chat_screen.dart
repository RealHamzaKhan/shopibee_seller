import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/views/message_screen/components/message_bubble.dart';
class ChatScreen extends StatelessWidget {
  
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: "Username".text.make(),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(child:SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
            children: List.generate(20, (index) {
              return messageBubble(isSender: false);
            }),
          ))),
          TextFormField(
            maxLines: null,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: Icon(Icons.send),
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