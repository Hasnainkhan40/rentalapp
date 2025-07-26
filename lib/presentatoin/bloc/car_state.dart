// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rentalapp/data/models/car.dart';

abstract class CarState {}

class CarsLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<Car> cars;
  CarsLoaded({required this.cars});
}

class CarsError extends CarState {
  final String message;
  CarsError({required this.message});
}
