import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_counter_app/cubit/states.dart';

class PointsCounterAppCubit extends Cubit<PointsCounterAppStates> {
  PointsCounterAppCubit() : super(PointsCounterAppInitialState());

  static PointsCounterAppCubit getObject(context) => BlocProvider.of(context);

  int teamACounter = 0;
  int teamBCounter = 0;

  void increaseOnePoint({required String teamName}) {
    if (teamName == "Team A") {
      teamACounter += 1;
    } else {
      teamBCounter += 1;
    }
    emit(IncreaseOnePointSuccessState());
  }

  void increaseTwoPoints({required String teamName}) {
    if (teamName == "Team A") {
      teamACounter += 2;
    } else {
      teamBCounter += 2;
    }
    emit(IncreaseTwoPointsSuccessState());
  }

  void increaseThreePoints({required String teamName}) {
    if (teamName == "Team A") {
      teamACounter += 3;
    } else {
      teamBCounter += 3;
    }
    emit(IncreaseThreePointsSuccessState());
  }

  void resetAllPoints() {
    teamACounter = 0;
    teamBCounter = 0;
    emit(ResetAllPointsSuccessState());
  }
}
