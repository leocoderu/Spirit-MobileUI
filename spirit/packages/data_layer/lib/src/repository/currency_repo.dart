// Packages
//import 'package:cloud_firestore/cloud_firestore.dart';

// Layers
//import 'package:model_layer/model_layer.dart';

class CurrencyRepo {
  // late CollectionReference<Currency> _currency;
  //
  // Future<List<Currency>?> getCurrency() async {
  //   _currency = await FirebaseFirestore.instance.collection('currency').withConverter<Currency>(
  //     fromFirestore: (snapshot, _) => Currency.fromJson(snapshot.data()!),
  //     toFirestore: (currency, _) => currency.toJson(),
  //   );
  //
  //   QuerySnapshot querySnapshot = await _currency.get();
  //   return querySnapshot.docs.map<Currency>((e) => e.data() as Currency).toList();
  // }
}