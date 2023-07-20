import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janin/models/produkmodel.dart';
import 'package:janin/theme.dart';

class ProdukCard extends StatelessWidget {
  final Function() onPressed;
  final ProdukModel produkModel;
  
  const ProdukCard(this.onPressed, this.produkModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    produkModel.logo,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    produkModel.nama,
                    style: labelText.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    produkModel.kategori,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
