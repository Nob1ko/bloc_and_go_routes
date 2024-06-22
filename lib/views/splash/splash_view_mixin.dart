part of "splash_view.dart";

mixin SplashViewMixin on State<SplashView> {
  final UserService _userService = UserService();

  Future<bool> _future(BuildContext context) async {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    String? authToken = await _userService.getAuthTokenFromSP();

    if (authToken == null) {
      loginBloc.add(const LogoutButtonPressed());
      if (context.mounted) {
       context.push(Routes.AUTH);
      }
    } else {
      loginBloc.add(ValidateAuthToken(authToken: authToken));
    }

    return true;
  }

  bool _checkValues(UserModel userModel) {
    if (userModel.firstName.isEmpty) return false;
    if (userModel.lastName.isEmpty) return false;
    if (userModel.dateOfBirth.toUtc() == AppConstants.nullDate) return false;
    if (userModel.gender == 0) return false;
    return true;
  }

  void _listener(LoginState state,
      {required LoginBloc loginBloc, required RegisterBloc registerBloc, required ProfileBloc profileBloc}) {
    if (state is ValidateSuccess) {
      profileBloc.add(SetUser(user: state.user));
      registerBloc.add(const ClearRegisterData());
      context.go(_checkValues(state.user) ? Routes.NAVIGATION : Routes.PROFILE);
    } else if (state is ValidateFailed) {
      loginBloc.add(const LogoutButtonPressed());
      registerBloc.add(const ClearRegisterData());
      context.go(Routes.AUTH);
      AppHelper.showErrorMessage(context: context, content: LocaleKeys.session_terminated.tr());
    }
  }
}
