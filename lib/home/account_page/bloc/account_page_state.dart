part of 'account_page_bloc.dart';

abstract class AccountPageState extends Equatable {
  const AccountPageState();

  @override
  List<Object> get props => [];
}

class AccountPageLoading extends AccountPageState {}

class AccountPageLoaded extends AccountPageState {
  final String userName;
  final String guildName;

  const AccountPageLoaded({required this.userName, required this.guildName});
}
