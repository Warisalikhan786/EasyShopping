// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:e_comm/models/order-model.dart';
import 'package:e_comm/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReviewScreen extends StatefulWidget {
  final OrderModel orderModel;
  const AddReviewScreen({super.key, required this.orderModel});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController feedbackController = TextEditingController();
  double productRating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text("Add Reviews"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Add your rating and review"),
            const SizedBox(
              height: 20.0,
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                productRating = rating;
                print(productRating);
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text("Feedback"),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: feedbackController,
              decoration:
                  const InputDecoration(label: Text("Share your feedback")),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () async {
                  String feedback = feedbackController.text.trim();
                  // print(feedback);
                  // print(productRating);
                },
                child: const Text("Done"))
          ],
        ),
      ),
    );
  }
}
