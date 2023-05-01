class RegularExp{
  static RegExp egyptPhoneRegex = RegExp(r'^01[0125][0-9]{8}$');
  static RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
  static RegExp emailRegex = RegExp(r"^.+@[a-zA-Z]+\.{0}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$");

}