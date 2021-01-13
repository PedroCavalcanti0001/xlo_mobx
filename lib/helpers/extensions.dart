extension StringExtension on String{
    bool isEmailValid(){
      RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      return emailValid.hasMatch(this);
    }
}