// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'db_provider.dart';
import 'barang.dart';

class UpdateBarang extends StatefulWidget {
  final Barang? barang;

  const UpdateBarang({Key? key, this.barang}) : super(key: key);

  @override
  State<UpdateBarang> createState() => _HomePageState();
}

class _HomePageState extends State<UpdateBarang> {
  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.barang!.id);
    _namaBarangController.text = widget.barang!.namaBarang;
    _hargaController.text = widget.barang!.harga;
    _stokController.text = widget.barang!.stok;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Barang"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _namaBarangController,
                  decoration: InputDecoration(
                    label: const Text('Nama Barang'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _hargaController,
                  decoration: InputDecoration(
                    label: const Text('Harga Barang'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _stokController,
                  decoration: InputDecoration(
                    label: const Text('Stok Barang'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FloatingActionButton.extended(
                      onPressed: () async {
                        final barang = Barang(
                            id: widget.barang!.id!,
                            namaBarang: _namaBarangController.text,
                            harga: _hargaController.text,
                            stok: _stokController.text,);
                        Provider.of<DbProvider>(context, listen: false)
                            .updateBarangs(barang);
                        Navigator.pop(context);
                      },
                      label: const Text("Update Barang"),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ))
              ]),
        ),
      )),
    );
  }
}