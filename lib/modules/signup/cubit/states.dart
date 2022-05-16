abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpSucceededState extends SignUpStates {}

class SignUpFailedState extends SignUpStates {
  final String error;

  SignUpFailedState(this.error);
}

class SignUpChangePasswordVisibilityState extends SignUpStates {}

class SignUpChangeCheckBoxValueState extends SignUpStates {}
