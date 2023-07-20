import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:janin/services/berandaservices.dart';
import 'package:janin/view/home/beranda.dart';
import 'package:janin/view/home/widget/produkcard.dart';
import '../../models/produkmodel.dart';
import '../../theme.dart';
import '../detail/produk.dart';

class Produk extends StatelessWidget {
  Produk({super.key});

  BerandaService berandaService = BerandaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
        title: Text('Produk', style: appBarStyle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<Object?>>(
          stream: berandaService.streamProduk(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var data = snapshot.data!.docs;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final dataProduk =
                          data[index].data() as Map<String, dynamic>;
                      return ProdukCard(
                        produkModel: ProdukModel(
                          logo: dataProduk['logo'],
                          nama: dataProduk['nama'],
                          kategori: dataProduk['kategori'],
                          rate: dataProduk['rate'],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProdukDetail(
                                idDoc: data[index].id,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
