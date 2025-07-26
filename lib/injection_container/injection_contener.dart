import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:rentalapp/data/datasources/firebase_car_data_source.dart';
import 'package:rentalapp/data/repositories/car_repository_impl.dart';
import 'package:rentalapp/domain/repository/car_repository.dart';
import 'package:rentalapp/domain/usecases/get_cars.dart';
import 'package:rentalapp/presentatoin/bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()),
    );

    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(datasource: getIt<FirebaseCarDataSource>()),
    );
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));

    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw e;
  }
}
