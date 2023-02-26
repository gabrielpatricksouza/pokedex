import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/design_system/custom_text_field.dart';
import 'package:franq/app/modules/login/login_routes.dart';
import 'package:franq/app/commons/design_system/custom_alert.dart';
import 'package:franq/app/commons/design_system/custom_text_field_password.dart';
import '../../../../../../commons/design_system/custom_animated_button.dart';
import 'dart:math' as math;

import 'cubit/auth_cubit.dart';
import 'cubit/login_in_cubit.dart';
import 'cubit/visible_password_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = Modular.get<LoginController>();
  final _controllerAuth = Modular.get<AuthCubit>();
  final _verifyPasswordCubit = VisiblePasswordCubit();

  late AnimationController _animationController;
  late Animation _animation;

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _isCircle = false;

  onInitLogin(){
    _toggleShape();
    _controllerAuth.isLoggedUser();
    if(_controllerAuth.state){
      LoginRoutes.goToHome();
    }
    _toggleShape();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    onInitLogin();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.deepPurpleAccent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildLogo(),
              _buildLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Image.asset(
            "assets/pokemon-png-logo.png",
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return AnimatedContainer(
      height: _getSize().height,
      width: _getSize().width,
      margin: EdgeInsets.only(
          top: _isCircle ? MediaQuery.of(context).size.height * 0.2 : 8.0),
      padding: EdgeInsets.symmetric(horizontal: _isCircle ? 0.0 : 20.0),
      decoration: _decoration(),
      duration: const Duration(milliseconds: 500),
      child: _isCircle ? _animatedPokeball() : _listWidgets(),
    );
  }

  Size _getSize() {
    if (_isCircle) {
      return const Size(150, 150);
    }
    return Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.755,
    );
  }

  Decoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: _isCircle
          ? BorderRadius.circular(100)
          : const BorderRadius.only(
              topRight: Radius.circular(24.0),
              topLeft: Radius.circular(24.0),
            ),
    );
  }

  Widget _animatedPokeball() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * 2.0 * math.pi,
          child: child,
        );
      },
      child: _pokeball(),
    );
  }

  Widget _pokeball() {
    return GestureDetector(
      onTap: _toggleShape,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 3,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              top: 50,
              bottom: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listWidgets() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        _title(),
        _inputs(),
        _signInButton(),
        _underLine(),
        _signUpButton(),
      ],
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        'Login',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget _inputs() {
    return Column(
      children: [
        /// E-mail
        CustomTextField(
          hintText: 'E-mail',
          icon: Icon(
            Icons.alternate_email_rounded,
            color: Colors.grey[700],
          ),
          textInputType: TextInputType.emailAddress,
          controller: _email,
        ),
        const SizedBox(height: 20),

        ///Password
        CustomTextFieldPassword(
          hintText: 'Senha',
          icon: Icon(
            Icons.lock_outline_rounded,
            color: Colors.grey[700],
          ),
          onTapPassword: () {
            _verifyPasswordCubit.toggleBoolValue();
          },
          visualizar: _verifyPasswordCubit.state,
          password: true,
          obscureText: _verifyPasswordCubit.state,
          textInputType: TextInputType.visiblePassword,
          controller: _password,
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _underLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 1.0,
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade400),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10.0, left: 16.0, right: 16.0),
            child: Text(
              'OU',
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ),
          Expanded(
            child: Container(
              height: 1.0,
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return CustomAnimatedButton(
      onTap: () async {
        FocusScope.of(context).unfocus();
        _toggleShape();
        await _controller.signIn(_email.text, _password.text).then((isLogged) async {
          if (isLogged) {
            _animationController.reverse();
            LoginRoutes.goToHome();
          } else {
            ///To show the animation
            await Future.delayed(
              const Duration(seconds: 1),
              () async {
                _toggleShape();
                await showAlert(context, _controller.messageError);
              },
            );
          }
        });
      },
      widhtMultiply: 1,
      height: 53,
      colorText: Colors.white,
      color: Colors.pinkAccent,
      text: "Sign In",
    );
  }

  Widget _signUpButton() {
    return OutlinedButton(
      onPressed: () async {
        FocusScope.of(context).unfocus();
        _toggleShape();
        await _controller.signUp(_email.text, _password.text).then((isLogged) async {
          if (isLogged) {
            _animationController.reverse();
            LoginRoutes.goToHome();
          } else {
            ///To show the animation
            await Future.delayed(
              const Duration(seconds: 1),
                  () async {
                _toggleShape();
                await showAlert(context, _controller.messageError);
              },
            );
          }
        });
      },
      style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(
        color: Colors.deepPurpleAccent,
      ))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.deepPurpleAccent),
        ),
      ),
    );
  }

  void _toggleShape() {
    setState(() {
      _isCircle = !_isCircle;
      if (_isCircle) {
        _animationController.repeat();
      } else {
        _animationController.reverse();
      }
    });
  }
}
