import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lernvloc/bloc/persegipanjangbloc.dart';
import 'package:lernvloc/events/persegipanjangEvent.dart';

class Bagundatar extends StatelessWidget {
  const Bagundatar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController panjangController = TextEditingController();
    final TextEditingController lebarController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator Persegi Panjang")),

      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: TextField(
                          controller: panjangController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "input panjang",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: TextField(
                          controller: lebarController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "input lebar",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () {
                            double panjang =
                                double.tryParse(panjangController.text) ?? 0;
                            double lebar =
                                double.tryParse(lebarController.text) ?? 0;

                            // Kirim event ke BLoC
                            // context.read<RectangleBloc>() bisa langsung dipanggil
                            // karena BlocProvider sudah ada di level atas (main.dart)
                            context.read<RectangleBloc>().add(
                              CalculateAreaEvent(panjang, lebar),
                            );
                          },
                          child: const Text('Hitung Luas'),
                        ),
                      ),
                    ),

                    // Tombol Hitung Keliling
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () {
                            double panjang =
                                double.tryParse(panjangController.text) ?? 0;
                            double lebar =
                                double.tryParse(lebarController.text) ?? 0;

                            context.read<RectangleBloc>().add(
                              CalculatePerimeterEvent(panjang, lebar),
                            );
                          },
                          child: const Text('Hitung Keliling'),
                        ),
                      ),
                    ),
                  ],
                ),

                // BlocBuilder = Widget yang rebuild ketika state berubah
                BlocBuilder<RectangleBloc, RectangleState>(
                  builder: (context, state) {
                    // Cek state apa yang aktif sekarang
                    if (state is RectangleCalculated) {
                      // Kalau state adalah RectangleCalculated, tampilkan hasil
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "${state.type}: ${state.result.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (state is RectangleReset) {
                      // Kalau state adalah RectangleReset, tampilkan teks kosong
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text("Hasil: -", style: TextStyle(fontSize: 24)),
                      );
                    } else {
                      // State awal (RectangleInitial)
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text("Hasil: -", style: TextStyle(fontSize: 24)),
                      );
                    }
                  },
                ),
              ],
            ),

            // Tombol Reset
            Expanded(
              child: Align(
                alignment: AlignmentGeometry.bottomCenter,

                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Kirim event reset
                      context.read<RectangleBloc>().add(ResetEvent());

                      //Kosongkan input field
                      panjangController.clear();
                      lebarController.clear();
                    },
                    child: const Text('Reset'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
