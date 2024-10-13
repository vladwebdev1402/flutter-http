import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laba_http/screens/cubit/nasa_state.dart';
import 'package:laba_http/screens/cubit/nasa_cubit.dart';
import 'package:laba_http/widgets/nasa_card/nasa_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(Object context) {
    return BlocBuilder<NasaCubit, NasaState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Кривенко В.В.",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<NasaCubit>(context).getData();
                },
                icon: const Icon(Icons.refresh_outlined, color: Colors.white))
          ],
        ),
        body: Builder(
          builder: (context) {
            if (state is NasaLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is NasaLoadedState) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Photos: ${state.data.photos!.length}",
                            style: const TextStyle(fontSize: 22.0)),
                        const Divider(),
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => NasaCard(
                                    photo: state.data.photos![index],
                                    index: index + 1,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 24.0,
                                  ),
                              itemCount: state.data.photos!.length),
                        )
                      ]));
            }

            if (state is NasaErorState) {
              return Center(
                child: Text(state.error),
              );
            }

            return Container();
          },
        ),
      );
    });
  }
}
