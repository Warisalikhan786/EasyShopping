// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, unused_local_variable, avoid_print, prefer_const_declarations, deprecated_member_use, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/controllers/rating_controller.dart';
import 'package:e_comm/models/product-model.dart';
import 'package:e_comm/models/review_model.dart';
import 'package:e_comm/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/cart-model.dart';
import 'cart-screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;
  ProductDetailsScreen({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    CalculateProductRatingController calculateProductRatingController = Get.put(
        CalculateProductRatingController(widget.productModel.productId));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Product Details",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //product images

              SizedBox(
                height: Get.height / 60,
              ),
              CarouselSlider(
                items: widget.productModel.productImages
                    .map(
                      (imageUrls) => ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl: imageUrls,
                          fit: BoxFit.cover,
                          width: Get.width - 10,
                          placeholder: (context, url) => ColoredBox(
                            color: Colors.white,
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  aspectRatio: 2.5,
                  viewportFraction: 1,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.productModel.productName,
                              ),
                              Icon(Icons.favorite_outline)
                            ],
                          ),
                        ),
                      ),
                      //review
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: RatingBar.builder(
                              glow: false,
                              ignoreGestures: true,
                              initialRating: double.parse(
                                  calculateProductRatingController.averageRating
                                      .toString()),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 25,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (value) {},
                            ),
                          ),
                          Text(calculateProductRatingController.averageRating
                              .toString()),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              widget.productModel.isSale == true &&
                                      widget.productModel.salePrice != ''
                                  ? Text(
                                      "PKR: " + widget.productModel.salePrice,
                                    )
                                  : Text(
                                      "PKR: " + widget.productModel.fullPrice,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Category: " + widget.productModel.categoryName,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.productModel.productDescription,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              child: Container(
                                width: Get.width / 3.0,
                                height: Get.height / 16,
                                decoration: BoxDecoration(
                                  color: AppConstant.appScendoryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextButton(
                                  child: Text(
                                    "WhatsApp",
                                    style: TextStyle(
                                        color: AppConstant.appTextColor),
                                  ),
                                  onPressed: () {
                                    sendMessageOnWhatsApp(
                                      productModel: widget.productModel,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Material(
                              child: Container(
                                width: Get.width / 3.0,
                                height: Get.height / 16,
                                decoration: BoxDecoration(
                                  color: AppConstant.appScendoryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextButton(
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: AppConstant.appTextColor),
                                  ),
                                  onPressed: () async {
                                    // Get.to(() => SignInScreen());

                                    await checkProductExistence(uId: user!.uid);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //reviews
              FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('products')
                    .doc(widget.productModel.productId)
                    .collection('review')
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: Get.height / 5,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No reviews found!"),
                    );
                  }

                  if (snapshot.data != null) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        ReviewModel reviewModel = ReviewModel(
                          customerName: data['customerName'],
                          customerPhone: data['customerPhone'],
                          customerDeviceToken: data['customerDeviceToken'],
                          customerId: data['customerId'],
                          feedback: data['feedback'],
                          rating: data['rating'],
                          createdAt: data['createdAt'],
                        );
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(reviewModel.customerName[0]),
                            ),
                            title: Text(reviewModel.customerName),
                            subtitle: Text(reviewModel.feedback),
                            trailing: Text(reviewModel.rating),
                          ),
                        );
                      },
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> sendMessageOnWhatsApp({
    required ProductModel productModel,
  }) async {
    final number = "+923075812354";
    final message =
        "Hello Techi4u \n i want to know about this product \n ${productModel.productName} \n ${productModel.productId}";

    final url = 'https://wa.me/$number?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //checkl prooduct exist or not

  Future<void> checkProductExistence({
    required String uId,
    int quantityIncrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(widget.productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      double totalPrice = double.parse(widget.productModel.isSale
              ? widget.productModel.salePrice
              : widget.productModel.fullPrice) *
          updatedQuantity;

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });

      print("product exists");
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );

      CartModel cartModel = CartModel(
        productId: widget.productModel.productId,
        categoryId: widget.productModel.categoryId,
        productName: widget.productModel.productName,
        categoryName: widget.productModel.categoryName,
        salePrice: widget.productModel.salePrice,
        fullPrice: widget.productModel.fullPrice,
        productImages: widget.productModel.productImages,
        deliveryTime: widget.productModel.deliveryTime,
        isSale: widget.productModel.isSale,
        productDescription: widget.productModel.productDescription,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        productQuantity: 1,
        productTotalPrice: double.parse(widget.productModel.isSale
            ? widget.productModel.salePrice
            : widget.productModel.fullPrice),
      );

      await documentReference.set(cartModel.toMap());

      print("product added");
    }
  }
}
