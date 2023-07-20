import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janin/models/produkmodel.dart';
import 'package:janin/services/berandaservices.dart';
import 'package:janin/theme.dart';
import 'package:janin/view/home/produk.dart';
import 'package:janin/view/home/widget/produkcard.dart';

class Beranda extends StatelessWidget {
  Beranda({super.key});

  BerandaService berandaService = BerandaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hi, Moms',
                style: labelText.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 115,
                  width: 307,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Untuk mengetahui kondisi janin anda dapat mengisi form dengan klik button form prediksi',
                      style: GoogleFonts.poppins(
                        color: pinkColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk Untuk Moms',
                    style: GoogleFonts.poppins(
                      color: pinkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: buttonlabelhomeText.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot<Object?>>(
                stream: berandaService.streamProduk(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var data = snapshot.data!.docs;
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final dataProduk =
                              data[index].data() as Map<String, dynamic>;
                          return ProdukCard(
                            ProdukModel(
                              logo: dataProduk['logo'],
                              nama: dataProduk['nama'],
                              kategori: dataProduk['kategori'],
                            ),
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Produk()),
                              );
                            } as ProdukModel,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
