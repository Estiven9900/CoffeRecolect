class User {
  int? id;
  String nombre;
  String usuario;
  String password;
  String rol;

  User({
    this.id,
    required this.nombre,
    required this.usuario,
    required this.password,
    required this.rol,
  });

  // Convertir de un Map (de la BD) a un objeto User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nombre: map['nombre'],
      usuario: map['usuario'],
      password: map['password'],
      rol: map['rol'],
    );
  }

  // Convertir un objeto User a un Map (para la BD)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'usuario': usuario,
      'password': password,
      'rol': rol,
    };
  }
}