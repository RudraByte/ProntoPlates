import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods{
  Future adduserDetail(Map<String, dynamic> userInfoMap,String id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).set(userInfoMap);

  }
  updateUserWallet(String id, String amount) async{
    return await FirebaseFirestore.instance.collection('users').doc(id).update({'Wallet':amount});
  }
  Future addFoodItem(Map<String, dynamic> userInfoMap,String name)async{
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);

  }

  Future<Stream<QuerySnapshot>> getfoofItem(String name) async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
}