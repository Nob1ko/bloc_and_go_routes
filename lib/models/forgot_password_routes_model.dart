import 'package:flutter/material.dart';
import 'package:template_app_bloc/blocs/auth/register/register_state.dart';

class ForgotPasswordRoutesModel {
  final TextEditingController textEditingController;
  final void Function(RegisterState registerState) forgotPasswordListener;
 
 TextEditingController get controller {
  return textEditingController;
 }
  ForgotPasswordRoutesModel({required this.textEditingController,required this.forgotPasswordListener});

}