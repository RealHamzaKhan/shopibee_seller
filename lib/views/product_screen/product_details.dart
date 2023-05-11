import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/widgets/textstyles.dart';

class ProductDetails extends StatelessWidget {
  var snap;
 ProductDetails({super.key,this.snap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "${snap['p_name']}".text.make(),
        automaticallyImplyLeading: true,
        centerTitle: false,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                viewportFraction: 1.0,
                autoPlay: true,
                aspectRatio: 16 / 12,
                enlargeCenterPage: true,
                itemCount: snap['p_images'].length,
                itemBuilder: (context, index) {
                  return Image.network(
                      "${snap['p_images'][index]}",
                      fit: BoxFit.fill);
                }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightBox,
                "${snap['p_name']}".text.bold.size(18).make(),
                10.heightBox,
                Row(
                  children: [
                    boldText(value: "${snap['p_category']}",color: Colors.black),
                    5.widthBox,
                    normalText(value: "${snap['p_subcategory']}",color: darkGrey),
                  ],
                ),
                20.heightBox,
                VxRating(
                  onRatingUpdate: (value) {},
                  selectionColor: golden,
                  size: 30,
                  maxRating: 5,
                  isSelectable: false,
                  value: double.parse(snap['p_rating'])
                ),
                20.heightBox,
                "${snap['p_price']}".text.bold.size(20).red700.make(),
              ],
            ).p8(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    "Colors : "
                        .text
                        .color(fontGrey)
                        .make()
                        .box
                        .width(100)
                        .make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          snap['p_colors'].length,
                          (index) => Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(int.parse(snap['p_colors'][index])),
                                  ).marginSymmetric(horizontal: 10),
                                ],
                              )),
                    ),
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    "Quaintity : "
                        .text
                        .color(fontGrey)
                        .make()
                        .box
                        .width(100)
                        .make(),
                    Row(
                      children: [
                        "${snap['p_quantity']}".text.bold.size(16).make(),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                boldText(value: "Description",color: Colors.black,size: 18.0),
                10.heightBox,
                normalText(value: "${snap['p_desc']}",color: Colors.black)

              ],
            )
                .box
                .white
                .padding(EdgeInsets.all(12))
                .width(double.infinity)
                .make(),
          ],
        ),
      ),
    );
  }
}
