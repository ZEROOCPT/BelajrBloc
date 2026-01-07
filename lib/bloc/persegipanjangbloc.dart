import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lernvloc/events/persegipanjangEvent.dart';

//BLoC untuk otak logic
class RectangleBloc extends Bloc<RectangleEvent, RectangleState> {
  //State awal saat aplikasi dibuka
  RectangleBloc() : super(RectangleInitial()) {
    //Event untuk menghitung luas
    on<CalculateAreaEvent>((event, emit) {
      //Ambil nilai
      double panjang = event.panjang;
      double lebar = event.lebar;

      //Hitung
      double luas = panjang * lebar;

      //Kirim hasil ke UI
      emit(RectangleCalculated(luas, "Luas"));
    });

    //Event untuk menghitung keliling
    on<CalculatePerimeterEvent>((event, emit) {
      //Ambil nilai
      double panjang = event.panjang;
      double lebar = event.lebar;

      //Hitung
      double keliling = 2 * (panjang + lebar);

      // Kirim hasil ke UI
      emit(RectangleCalculated(keliling, "Keliling"));
    });

    //reset
    on<ResetEvent>((event, emit) {
      emit(RectangleReset());
    });
  }
}
