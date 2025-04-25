import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/evento.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080/api/eventos';

  /// Obtener eventos (opcionalmente filtrados por ciudad)
  Future<List<Evento>> fetchEventos({String? ciudad}) async {
    try {
      final uri = ciudad != null && ciudad.isNotEmpty
          ? Uri.parse('http://10.0.2.2:8080/api/eventos/traer?ciudad=$ciudad')
          : Uri.parse('http://10.0.2.2:8080/api/eventos/traer');

      print('⌛ Llamando a la API: $uri');

      final response = await http.get(uri).timeout(const Duration(seconds: 10));

      print('📥 Código de respuesta: ${response.statusCode}');
      print('📥 Body de respuesta: ${response.body}');

      if (response.statusCode == 200) {
        List jsonData = jsonDecode(response.body);
        print('📦 JSON decodeado: $jsonData');
        return jsonData.map((e) => Evento.fromJson(e)).toList();
      } else {
        print('❌ Error de respuesta HTTP: ${response.statusCode}');
        throw Exception('Error al cargar eventos');
      }
    } catch (e) {
      print('❌ Error capturado: $e');
      rethrow;
    }
  }


    /// Crear un nuevo evento
  Future<void> crearEvento(Evento evento) async {
    final url = Uri.parse(baseUrl);

    print('📤 Enviando nuevo evento: ${evento.titulo}, ${evento.ciudad}, ${evento.categoria}');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'titulo': evento.titulo,
        'ciudad': evento.ciudad,
        'categoria': evento.categoria,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('✅ Evento creado con éxito');
    } else {
      print('❌ Error al crear evento: ${response.statusCode}');
      throw Exception('No se pudo crear el evento');
    }
  }
}