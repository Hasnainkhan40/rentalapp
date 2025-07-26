import 'package:rentalapp/data/models/car.dart';
import 'package:rentalapp/domain/repository/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
