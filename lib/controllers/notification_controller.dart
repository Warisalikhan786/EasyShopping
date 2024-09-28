import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  var notificationCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotificationCount();
  }

  //
  void fetchNotificationCount() {
    FirebaseFirestore.instance
        .collection("notifications")
        .doc(user!.uid)
        .collection('notifications')
        .where("isSeen", isEqualTo: false)
        .snapshots()
        .listen(
      (QuerySnapshot querySnapshot) {
        notificationCount.value = querySnapshot.docs.length;
        print("Notification lenghth => ${notificationCount.value}");
        update();
      },
    );
  }
}
