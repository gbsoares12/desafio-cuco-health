import 'package:desafio_cuco/features/presentation/controllers/bloc/user_bloc.dart';
import 'package:desafio_cuco/features/presentation/pages/home/widgets/LoadingContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetListUser(count: 15));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
      body: Container(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is LoadedListUser) {
              return ListView.builder(
                  itemCount: state.listUser.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            title: Text(state.listUser[index].name),
                            subtitle: Text(state.listUser[index].email),
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    state.listUser[index].photoUrl))));
                  });
            } else if (state is Loading) {
              return LoadingContainer();
            } else if (state is Error) {
              return Center(
                child: Container(
                  child: Text(state.message),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
