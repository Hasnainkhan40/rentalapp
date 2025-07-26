import 'package:bloc/bloc.dart';
import 'package:rentalapp/domain/usecases/get_cars.dart';
import 'package:rentalapp/presentatoin/bloc/car_event.dart';
import 'package:rentalapp/presentatoin/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try {
        final cars = await getCars.call();
        emit(CarsLoaded(cars: cars));
      } catch (e) {
        emit(CarsError(message: e.toString()));
      }
    });
  }
}
