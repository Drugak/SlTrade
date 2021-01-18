class AuthPreloginModel {
  String salt;
  String keysize;
  String pass;
  String iv;
  String iterations;
  String token;

  AuthPreloginModel(
      {this.salt,
      this.keysize,
      this.pass,
      this.iv,
      this.iterations,
      this.token});

  AuthPreloginModel.fromJson(Map<String, dynamic> json) {
    salt = json['salt'];
    keysize = json['keysize'];
    pass = json['pass'];
    iv = json['iv'];
    iterations = json['iterations'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salt'] = this.salt;
    data['keysize'] = this.keysize;
    data['pass'] = this.pass;
    data['iv'] = this.iv;
    data['iterations'] = this.iterations;
    data['token'] = this.token;
  }
}
