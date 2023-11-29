import 'package:flutter/material.dart';
import 'package:mobile_project/controllers/peminjaman_controller.dart';
import 'package:provider/provider.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class Peminjaman {
  String namaPeminjam;
  DateTime tanggalPeminjaman;
  TimeOfDay waktuPeminjaman;

  Peminjaman({
    required this.namaPeminjam,
    required this.tanggalPeminjaman,
    required this.waktuPeminjaman,
    // ... tambahkan properti lain sesuai kebutuhan
  });
}

class _AddDataScreenState extends State<AddDataScreen> {
  final TextEditingController _namaController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
      ),
      body: AddDataForm(
        namaController: _namaController,
        selectedDate: _selectedDate,
        selectedTime: _selectedTime,
        onDateChanged: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
        onTimeChanged: (time) {
          setState(() {
            _selectedTime = time;
          });
        },
        onAddData: () {
          _addData(context);
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _addData(BuildContext context) {
    var peminjamanController =
        Provider.of<PeminjamanController>(context, listen: false);

    // Ambil data dari input pengguna
    String namaPeminjam = _namaController.text;

    // Buat objek Peminjaman baru
    Peminjaman newData = Peminjaman(
      namaPeminjam: namaPeminjam,
      tanggalPeminjaman: _selectedDate,
      waktuPeminjaman: _selectedTime,
      // ... tambahkan properti lain sesuai kebutuhan
    );

    // Tambahkan data ke PeminjamanController dengan mengonversi objek ke Map
    peminjamanController.addPeminjaman(newData.Map());

    // Setelah menambahkan data, kembali ke halaman sebelumnya
    Navigator.pop(context);
  }
}

class AddDataForm extends StatelessWidget {
  final TextEditingController namaController;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final VoidCallback onAddData;

  const AddDataForm({
    Key? key,
    required this.namaController,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
    required this.onAddData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: namaController,
            decoration: InputDecoration(labelText: 'Nama Peminjam'),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Text('Tanggal Peminjaman: ${selectedDate.toLocal()}'),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () async {
                  await _AddDataScreenState()._selectDate(context);
                },
                child: Text('Pilih Tanggal'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Text('Waktu Peminjaman: ${selectedTime.format(context)}'),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () async {
                  await _AddDataScreenState()._selectTime(context);
                },
                child: Text('Pilih Waktu'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onAddData,
            child: Text('Tambah Data'),
          ),
        ],
      ),
    );
  }
}
