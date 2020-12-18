class User {

  String email, password, number, address;
  //#Sign in uchun
  User({this.email, this.password});
  User.fromJsom(Map<String, dynamic> json)
      :
        email=json['email'],
        password=json['password'];
  Map<String,dynamic> toJson(){
    return {'email':this.email,'password':this.password};
  }

  //Sign up uchun
  User.from({this.email, this.number, this.address});
  User.fromJsonAccount(Map<String, dynamic> json):
      email=json['email'],
      number=json['number'],
      address=json['address'];
  Map<String,dynamic> toJsonAccount(){
    return {'email':this.email,'number':this.number,'address':this.address};
  }

}