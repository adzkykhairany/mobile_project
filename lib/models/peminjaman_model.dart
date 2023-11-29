import 'package:flutter/material.dart';

class Peminjaman {
  String id;
  String namaPeminjam;
  DateTime tanggalPeminjaman;
  TimeOfDay waktuPeminjaman;

  Peminjaman({
    required this.id,
    required this.namaPeminjam,
    required this.tanggalPeminjaman,
    required this.waktuPeminjaman,
  });

  // Fungsi untuk mengonversi TimeOfDay ke String
  static String convertTimeOfDayToString(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }

  // Fungsi untuk mengonversi String ke TimeOfDay
  static TimeOfDay convertStringToTimeOfDay(String timeString) {
    List<String> parts = timeString.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  // Fungsi untuk membuat objek Peminjaman dari Map yang diambil dari Firestore
  static Peminjaman fromMap(Map<String, dynamic> map) {
    return Peminjaman(
      id: map['id'],
      namaPeminjam: map['nama'],
      tanggalPeminjaman: map['tanggal'],
      waktuPeminjaman: convertStringToTimeOfDay(map['waktu']),
    );
  }

  // Fungsi untuk mengonversi objek Peminjaman ke Map sebelum disimpan ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': namaPeminjam,
      'tanggal': tanggalPeminjaman,
      'waktu': convertTimeOfDayToString(waktuPeminjaman),
    };
  }
}
