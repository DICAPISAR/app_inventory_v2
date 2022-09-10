class LoginRequest {
  final String name;
  final String password;

  LoginRequest(this.name, this.password);

  Map<String, String> toJson() {
    return {'name': name, 'password': password};
  }
}
