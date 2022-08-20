part of 'account_page_bloc.dart';

abstract class AccountPageEvent extends Equatable {
  const AccountPageEvent();

  @override
  List<Object> get props => [];
}

class AccountPageShowed extends AccountPageEvent {}

class AccountPageDeleteAccount extends AccountPageEvent {}

class AccountPageSignOut extends AccountPageEvent {}
