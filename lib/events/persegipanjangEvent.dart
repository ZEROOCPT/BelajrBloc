abstract class RectangleEvent {}

class CalculateAreaEvent extends RectangleEvent {
  final double panjang;
  final double lebar;
  CalculateAreaEvent(this.panjang, this.lebar);
}

class CalculatePerimeterEvent extends RectangleEvent {
  final double panjang;
  final double lebar;
  CalculatePerimeterEvent(this.panjang, this.lebar);
}

class ResetEvent extends RectangleEvent {}

abstract class RectangleState {}

class RectangleInitial extends RectangleState {}

class RectangleCalculated extends RectangleState {
  final double result;
  final String type;
  RectangleCalculated(this.result, this.type);
}

class RectangleReset extends RectangleState {}
