import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_project/controllers/peminjaman_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PeminjamanController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pencatatan Peminjaman'),
        ),
        body: PeminjamanList(),
        floatingActionButton: AddButton(),
      ),
    );
  }
}

class PeminjamanList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var peminjamanController = Provider.of<PeminjamanController>(context);

    return ListView.builder(
      itemCount: peminjamanController.peminjamanList.length,
      itemBuilder: (context, index) {
        var peminjaman = peminjamanController.peminjamanList[index];
        return ListTile(
          title: Text(peminjaman.namaPeminjam),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Navigasi ke halaman update data
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  peminjamanController.deletePeminjaman(peminjaman.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navigasi ke halaman tambah data
      },
      child: Icon(Icons.add),
    );
  }
}