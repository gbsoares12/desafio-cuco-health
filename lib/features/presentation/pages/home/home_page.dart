import 'package:desafio_cuco/features/presentation/controllers/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/LoadingContainer.dart';
import 'widgets/custom_circle_avatar.dart';
import 'widgets/home_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio Cuco Health"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/listUser');
        },
        child: const Icon(Icons.list),
        backgroundColor: Colors.blue,
      ),
      body: FractionallySizedBox(
        heightFactor: 1,
        child: Container(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is LoadedUser) {
                return Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Column(
                    children: [
                      CustomCircleAvatar(photoUrl: state.currentUser.photoUrl),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(top: 28.0, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              HomeTile(
                                label: "Nome Completo",
                                value: state.currentUser.name,
                              ),
                              HomeTile(
                                label: "E-mail",
                                value: state.currentUser.email,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is Loading) {
                return LoadingContainer();
              } else if (state is Error) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
