import 'package:emosque_mobile/providers/providers.dart';
import 'package:emosque_mobile/views/sekertaris/update_zakat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emosque_mobile/models/models.dart';
import 'package:provider/provider.dart';

class ReadDetailPenerimaZakat extends StatelessWidget {
  final YayasanZakat yayasanZakat;

  const ReadDetailPenerimaZakat({super.key, required this.yayasanZakat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: Text(
          "Detail Zakat",
          style: GoogleFonts.poppins(
              color: Colors.green[700],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              decoration:
                  const BoxDecoration(border: Border(top: BorderSide())),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.only(top: 12, left: 25, right: 25),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Yayasan : ',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      yayasanZakat.namaYayasan,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 12, left: 25, right: 25),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal Penyerahan : ",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${yayasanZakat.tanggal}",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 12, left: 25, right: 25),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekapan Total Uang : ",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Rp. ${yayasanZakat.rekapanUang}",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 12, left: 25, right: 25),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekapan Total Beras : ",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${yayasanZakat.rekapanBeras} kg",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Image.network(
                    'https://pbm2024.site/public/${yayasanZakat.gambarSurat}',
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                double buttonWidth =
                    constraints.maxWidth * 0.4; // 40% of the screen width

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: buttonWidth,
                      height: 40, // Increased height for better touch target
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<YayasanZProvider>(context, listen: false)
                              .deleteYayasan(yayasanZakat.idYayasanZakat)
                              .then((_) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Berhasil dihapus'),
                                  content: const Text(
                                      'Data yayasan penerima berhasil dihapus'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/homepageSekertaris');

                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('data yayasan penerima gagal dihapus'),
                            ));
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.white, size: 20),
                            SizedBox(width: 5),
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
