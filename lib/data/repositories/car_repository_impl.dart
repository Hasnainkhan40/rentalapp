// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rentalapp/data/datasources/firebase_car_data_source.dart';
import 'package:rentalapp/data/models/car.dart';
import 'package:rentalapp/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource datasource;
  CarRepositoryImpl({required this.datasource});

  @override
  Future<List<Car>> fetchCars() {
    return datasource.getCars();
  }
}
