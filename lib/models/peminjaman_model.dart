class Peminjaman {
  String id;
  String namaPeminjam;
  DateTime tanggalPinjam;
  bool isReturned;

  Peminjaman({
    required this.id,
    required this.namaPeminjam,
    required this.tanggalPinjam,
    required this.isReturned,
  });
}
