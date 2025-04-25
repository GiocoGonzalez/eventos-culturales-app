import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/evento.dart';
import 'evento_detalle_screen.dart';
import 'crear_evento_screen.dart';

class EventosScreen extends StatefulWidget {
  const EventosScreen({super.key});

  @override
  State<EventosScreen> createState() => _EventosScreenState();
}

class _EventosScreenState extends State<EventosScreen> {
  final _ciudadController = TextEditingController();
  late Future<List<Evento>> eventosFuture;

  @override
  void initState() {
    super.initState();
    _cargarEventos(); // Cambiado para que sea más claro
  }

  void _cargarEventos({String? ciudad}) {
    setState(() {
      eventosFuture = ApiService().fetchEventos(ciudad: ciudad);
    });
  }

  void buscarEventos() {
    String ciudad = _ciudadController.text.trim();
    if (ciudad.isEmpty) {
      _cargarEventos();
    } else {
      _cargarEventos(ciudad: ciudad);
    }
  }

  @override
  void dispose() {
    _ciudadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos Culturales'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ciudadController,
                    decoration: const InputDecoration(
                      labelText: 'Filtrar por ciudad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: buscarEventos,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Buscar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Evento>>(
              future: eventosFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay eventos disponibles.'));
                }

                final eventos = snapshot.data!;
                return ListView.builder(
                  itemCount: eventos.length,
                  itemBuilder: (context, index) {
                    final evento = eventos[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: ListTile(
                        title: Text(evento.titulo),
                        subtitle: Text('${evento.ciudad} - ${evento.categoria}'),
                        leading: const Icon(Icons.event, color: Colors.deepPurple),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EventoDetalleScreen(evento: evento),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: () async {
          final resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CrearEventoScreen()),
          );
          if (resultado == true) {
            _cargarEventos(); // Recarga todos los eventos si se crea uno nuevo
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}