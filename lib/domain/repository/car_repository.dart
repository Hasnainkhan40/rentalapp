import 'package:rentalapp/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
