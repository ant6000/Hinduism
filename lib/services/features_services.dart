import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:hinduism/data/model/feature_model.dart';

class FeaturesServices{
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String productCollection = 'Features lists';

  static Future<List<FeatureModel>> getFeatureList() async{
    var snapshot = await _database.collection(productCollection).get();
    print(snapshot.docs);
    return snapshot.docs
        .map((docSnapshot) => FeatureModel.fromMap(docSnapshot)).toList();
  }
}