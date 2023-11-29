import 'package:flutter/material.dart';
import 'package:mobile_project/models/peminjaman_model.dart';
import 'package:mobile_project/services/firebase_service.dart';

class PeminjamanController extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  List<Peminjaman>? peminjamanList;

  PeminjamanController() {
    _fetchPeminjaman();
  }

  Future<void> _fetchPeminjaman() async {
    var snapshots = _firebaseService.getPeminjaman();
    await for (var snapshot in snapshots) {
      peminjamanList = snapshot.docs
          .map((doc) => Peminjaman(
                id: doc.id,
                namaPeminjam: doc['namaPeminjam'],
                tanggalPeminjaman: doc['tanggalPeminjaman'].toDate(),
                waktuPeminjaman: TimeOfDay.fromDateTime(
                    doc['tanggalPeminjaman'].toDate()), // Tambahkan ini
              ))
          .toList();
      notifyListeners();
    }
  }

  Future<void> addPeminjaman(Map<String, dynamic> data) async {
    await _firebaseService.addPeminjaman(data);
  }

  Future<void> updatePeminjaman(String id, Map<String, dynamic> data) async {
    await _firebaseService.updatePeminjaman(id, data);
  }

  Future<void> deletePeminjaman(String id) async {
    await _firebaseService.deletePeminjaman(id);
  }
}
