import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/authorization/domain/entities/reset_password_entity.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_event.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_state.dart';
import 'package:wisefox/features/authorization/presentation/widgets/background_gradient.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showCupertinoDialog(
            context: context,
            builder:
                (_) =>
                    CupertinoAlertDialog(content: CupertinoActivityIndicator()),
          );
        } else if (state is AuthFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showCupertinoDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (_) => CupertinoAlertDialog(
                  title: Text("Error"),
                  content: Text(state.error),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("OK"),
                      onPressed:
                          () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                    ),
                  ],
                ),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
          if (state is AuthSuccess) {
            showCupertinoDialog(
              context: context,
              builder:
                  (_) => CupertinoAlertDialog(
                    title: Text("Success"),
                    content: Text(state.message),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("OK"),
                        onPressed:
                            () =>
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(),
                      ),
                    ],
                  ),
            );
          }
        }
      },
      child: CupertinoPageScaffold(
        child: BackgroundGradient(
          child: Padding(
            padding: EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 30),
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    color: CustomColors.offWhite,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter your email address and we’ll send\nyou a link to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: CustomColors.offWhite, fontSize: 16),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        RoundedTextField(
                          hintText: 'Email',
                          icon: 'assets/icons/Email.svg',
                          controller: _emailController,
                        ),
                        SizedBox(height: 25),
                        RoundedGradientButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final resetPasswordEntity = ResetPasswordEntity(
                                email: _emailController.text.trim(),
                              );
                              context.read<AuthBloc>().add(
                                ResetPasswordRequested(
                                  entity: resetPasswordEntity,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
