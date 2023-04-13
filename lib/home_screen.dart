import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubit/cubit.dart';
import '/cubit/states.dart';
import '/widgets/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PointsCounterAppCubit(),
      child: BlocConsumer<PointsCounterAppCubit, PointsCounterAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          PointsCounterAppCubit cubit =
              PointsCounterAppCubit.getObject(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("Basketball Points Counter"),
              titleTextStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.8,
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.deepOrange,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      teamBuilder(
                        teamName: "Team A",
                        teamPointsCounter: cubit.teamACounter,
                        onePointButtonFunc: () {
                          cubit.increaseOnePoint(teamName: "Team A");
                        },
                        twoPointsButtonFunc: () {
                          cubit.increaseTwoPoints(teamName: "Team A");
                        },
                        threePointsButtonFunc: () {
                          cubit.increaseThreePoints(teamName: "Team A");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Container(
                          width: 3,
                          height: 550,
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      teamBuilder(
                        teamName: "Team B",
                        teamPointsCounter: cubit.teamBCounter,
                        onePointButtonFunc: () {
                          cubit.increaseOnePoint(teamName: "Team B");
                        },
                        twoPointsButtonFunc: () {
                          cubit.increaseTwoPoints(teamName: "Team B");
                        },
                        threePointsButtonFunc: () {
                          cubit.increaseThreePoints(teamName: "Team B");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  MyButton(
                    buttonText: "Reset",
                    onPressed: () {
                      cubit.resetAllPoints();
                    },
                    width: 150,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget teamBuilder({
    required String teamName,
    required int teamPointsCounter,
    required void Function()? onePointButtonFunc,
    required void Function()? twoPointsButtonFunc,
    required void Function()? threePointsButtonFunc,
  }) {
    return Column(
      children: <Widget>[
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$teamPointsCounter",
          style: const TextStyle(
            fontSize: 200,
            fontWeight: FontWeight.w400,
          ),
        ),
        MyButton(buttonText: "Add 1 Point", onPressed: onePointButtonFunc),
        MyButton(buttonText: "Add 2 Points", onPressed: twoPointsButtonFunc),
        MyButton(buttonText: "Add 3 Points", onPressed: threePointsButtonFunc),
      ],
    );
  }
}
