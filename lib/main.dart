import 'package:basketball_points_counter_app/cubit/counter_cubit_cubit.dart';
import 'package:basketball_points_counter_app/widget/custom_elevated_button.dart';
import 'package:basketball_points_counter_app/widget/team_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(PointsCounter());
}

class PointsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key});
  int teamApoints=0;
    int teamBpoints=0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterCubitState>(
      listener: (context, state) {
        if(state is CounterAInCrementState){
          teamApoints=BlocProvider.of<CounterCubit>(context).teamAPoints;
        }
        else{
            teamBpoints=BlocProvider.of<CounterCubit>(context).teamBPoints;
        }
        
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text("Points Counter"),
          ),
          body: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TeamSection(
                    teamName: "Team A",
                    points: BlocProvider.of<CounterCubit>(context).teamAPoints.toString(),
                    onPressed: (points) {
                      
                      BlocProvider.of<CounterCubit>(context).TeamInCrement(team: "A", buttonNumber: points);
                    },
                  ),
                  const SizedBox(
                    height: 350,
                    child: VerticalDivider(color: Colors.grey, thickness: 1),
                  ),
                  TeamSection(
                    teamName: "Team B",
                    points: BlocProvider.of<CounterCubit>(context).teamBPoints.toString(),
                    onPressed: (points) {
                       BlocProvider.of<CounterCubit>(context).TeamInCrement(team: "B", buttonNumber: points);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
              CustomElevatedButton(text: "Reset", onPressed: () {
            BlocProvider.of<CounterCubit>(context).TeamReset();

              }),
            ],
          ),
        );
      },
    );
  }
}
