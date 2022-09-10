class LoginResponse {
  final int id;
  final String name;
  final int rolId;
  final String rolName;
  final String idSession;

  LoginResponse({
    required this.id,
    required this.name,
    required this.rolId,
    required this.rolName,
    required this.idSession,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
      name: json['name'],
      rolId: json['rolId'],
      rolName: json['rolName'],
      idSession: json['idSession'],
    );
  }
}
