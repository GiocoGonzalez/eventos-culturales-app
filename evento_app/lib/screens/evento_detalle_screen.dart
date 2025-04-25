import 'package:flutter/material.dart';
import '../models/evento.dart';

class EventoDetalleScreen extends StatelessWidget {
  final Evento evento;

  const EventoDetalleScreen({super.key, required this.evento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(evento.titulo),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título: ${evento.titulo}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Ciudad: ${evento.ciudad}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Categoría: ${evento.categoria}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}