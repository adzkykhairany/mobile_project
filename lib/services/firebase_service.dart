import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference peminjamanCollection =
      FirebaseFirestore.instance.collection('peminjaman');

  Future<void> addPeminjaman(Map<String, dynamic> data) async {
    await peminjamanCollection.add(data);
  }

  Stream<QuerySnapshot> getPeminjaman() {
    return peminjamanCollection.snapshots();
  }

  Future<void> updatePeminjaman(String id, Map<String, dynamic> data) async {
    await peminjamanCollection.doc(id).update(data);
  }

  Future<void> deletePeminjaman(String id) async {
    await peminjamanCollection.doc(id).delete();
  }
}
