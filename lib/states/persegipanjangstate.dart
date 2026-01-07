// State = Kondisi/Status aplikasi yang akan ditampilkan di UI
// Ini seperti "apa yang harus ditampilkan ke user"

abstract class RectangleState {}

// State awal, belum ada perhitungan
class RectangleInitial extends RectangleState {}

// State ketika hasil sudah dihitung
class RectangleCalculated extends RectangleState {
  final double result; // Hasil perhitungan (luas atau keliling)
  final String type; // Jenis perhitungan ("Luas" atau "Keliling")

  RectangleCalculated(this.result, this.type);
}

// State ketika di-reset
class RectangleReset extends RectangleState {}
