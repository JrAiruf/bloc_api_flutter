import 'package:bloc_api_flutter/app/blocs/app_events.dart';
import 'package:bloc_api_flutter/app/blocs/app_states.dart';
import 'package:bloc_api_flutter/app/blocs/user_bloc.dart';
import 'package:bloc_api_flutter/app/models/user_model.dart';
import 'package:bloc_api_flutter/app/pages/details_page.dart';
import 'package:bloc_api_flutter/app/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final repo = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(repo)..add(UserInitialEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: BlocBuilder<UserBloc, UserStates>(
              builder: ((context, state) {
                if (state is UserInitialState) {
                  return Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(175, 65),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () {
                        context.read<UserBloc>().add(LoadUserEvent());
                      },
                      child: const Text(
                        'Show Contacts',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  );
                }
                if (state is UserLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is UserLoadedState) {
                  final List<UserModel> usersLIst = state.users;

                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      itemCount: usersLIst.length,
                      itemBuilder: (_, index) {
                        return Card(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23)),
                            color: Theme.of(context).primaryColor,
                            child: ListTile(
                              onTap: (() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        DetailsPage(usersLIst[index])));
                              }),
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(usersLIst[index].avatar),
                                  radius: 35),
                              subtitle: Text(
                                usersLIst[index].email,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              title: Text(
                                usersLIst[index].firstName,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ));
                      });
                }
                return Container();
              }),
            ),
          ),
        ),
      ),
    );
  }
}
