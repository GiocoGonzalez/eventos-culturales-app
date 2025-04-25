class Evento {
  final int id;
  final String titulo;
  final String ciudad;
  final String categoria;

  Evento({
    required this.id,
    required this.titulo,
    required this.ciudad,
    required this.categoria,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json['id'],
      titulo: json['titulo'],
      ciudad: json['ciudad'],
      categoria: json['categoria'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'ciudad': ciudad,
      'categoria': categoria,
    };
  }
}