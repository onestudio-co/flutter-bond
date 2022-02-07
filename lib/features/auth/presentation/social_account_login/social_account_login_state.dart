import 'package:equatable/equatable.dart';
import 'package:fixit/features/auth/data/models/user.dart';

abstract class SocialAccountLoginState extends Equatable {}

class InitialSocialAccountLoginState extends SocialAccountLoginState {
  @override
  List<Object> get props => [];
}

class SocialAccountLoginLoading extends SocialAccountLoginState {
  @override
  List<Object> get props => [];
}

class SocialAccountLoginSuccess extends SocialAccountLoginState {
  final User user;
  final String channel;

  SocialAccountLoginSuccess({required this.user, required this.channel});

  @override
  List<Object> get props => [user, channel];
}

class SocialAccountLoginFailed extends SocialAccountLoginState {
  final String error;
  final String? code;

  SocialAccountLoginFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? 0];
}
