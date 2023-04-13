import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_counter_app/cubit/states.dart';

class PointsCounterAppCubit extends Cubit {
  PointsCounterAppCubit() : super(PointsCounterAppInitialState());

  static PointsCounterAppCubit getObject(context) => BlocProvider.of(context);
}
