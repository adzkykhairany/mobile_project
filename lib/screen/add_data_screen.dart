import 'package:flutter/material.dart';
import 'package:mobile_project/controllers/peminjaman_controller.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
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
    // Your logic to add data
    // ...

    // After adding data, navigate back to the previous screen
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
                onPressed: () => _selectDate(context),
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
                onPressed: () => _selectTime(context),
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
