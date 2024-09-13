import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class FeatureModel{
  String? en;
  String? bn;
  String? imgUrl;
   FeatureModel({this.en,this.bn, this.imgUrl});
   factory FeatureModel.fromMap(DocumentSnapshot<Map<String, dynamic>> map)=>
       FeatureModel(
         en: map['en'],
         bn: map['bd'],
         imgUrl: map['imgUrl ']
       );
}