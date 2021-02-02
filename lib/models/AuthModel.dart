class AuthPreloginModel {
  String salt;
  int keysize;
  String pass;
  String iv;
  int iterations;
  String token;

  AuthPreloginModel(
      {this.salt,
      this.keysize,
      this.pass,
      this.iv,
      this.iterations,
      this.token});

  AuthPreloginModel.fromJson(Map<dynamic, dynamic> json) {
    salt = json['salt'];
    keysize = json['keysize'];
    pass = json['pass'];
    iv = json['iv'];
    iterations = json['iterations'];
    token = json['token'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['salt'] = this.salt;
    data['keysize'] = this.keysize;
    data['pass'] = this.pass;
    data['iv'] = this.iv;
    data['iterations'] = this.iterations;
    data['token'] = this.token;
  }
}
