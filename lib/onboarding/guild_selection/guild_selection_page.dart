import 'package:cheese_app/bloc/app_bloc.dart';
import 'package:cheese_app/onboarding/guild_selection/bloc/guild_selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuildSelectionPage extends StatefulWidget {
  const GuildSelectionPage({Key? key}) : super(key: key);

  @override
  _GuildSelectionPageState createState() => _GuildSelectionPageState();
}

class _GuildSelectionPageState extends State<GuildSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select your guild'),
        ),
        body: BlocListener<GuildSelectionBloc, GuildSelectionState>(
          listener: (context, state) {
            if (state is GuildSelectionCompleted) {
              context
                  .read<AppBloc>()
                  .add(const AppAuthenticationStateChanged(isLoggedIn: true));
            }
          },
          child: BlocBuilder<GuildSelectionBloc, GuildSelectionState>(
            builder: (context, state) {
              if (state is GuildSelectionLoaded) {
                return ListView.builder(
                    itemCount: state.guilds.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(state.guilds[index].name),
                          onTap: () => context.read<GuildSelectionBloc>().add(
                              GuildSelectionSelected(
                                  guild: state.guilds[index])),
                        ),
                      );
                    }));
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
