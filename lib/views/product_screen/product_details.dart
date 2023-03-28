import 'package:emart_seller/consts/const.dart';
import 'package:emart_seller/widgets/textstyles.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Product Name".text.make(),
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Image.network(
                      "https://cdn.pixabay.com/photo/2022/08/15/15/38/animal-7388186_960_720.jpg",
                      fit: BoxFit.fill);
                }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightBox,
                "Product Name".text.bold.size(18).make(),
                10.heightBox,
                Row(
                  children: [
                    boldText(value: "Category",color: Colors.black),
                    5.widthBox,
                    normalText(value: "Subcategory",color: darkGrey),
                  ],
                ),
                20.heightBox,
                VxRating(
                  onRatingUpdate: (value) {},
                  selectionColor: golden,
                  size: 30,
                  maxRating: 5,
                  isSelectable: false,
                  value: 3,
                ),
                20.heightBox,
                "\$20".text.bold.size(20).red700.make(),
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
                          3,
                          (index) => Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Vx.randomColor,
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
                        "20".text.bold.size(16).make(),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                boldText(value: "Description",color: Colors.black,size: 18.0),
                10.heightBox,
                normalText(value: "Description will goes here .",color: Colors.black)

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
