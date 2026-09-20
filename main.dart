dartimport 'package:flutter/material.dart';

void main() {
  runApp(const ConozcoComprendoAcompanioApp());
}

class ConozcoComprendoAcompanioApp extends StatelessWidget {
  const ConozcoComprendoAcompanioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conozco, Comprendo y Acompaño',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A7C59)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conozco, Comprendo y Acompaño'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4A7C59),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            color: Color(0xFFE8F5E9),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '"NO BUSCAMOS CAMBIAR AL NIÑO. BUSCAMOS COMPRENDERLO PARA ACOMPAÑARLO."',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Una ruta para acompañar el desarrollo integral de 0 a 5 años',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildMenu(context, 'CONOZCO A MI HIJO', 'Cuestionario de observación sobre características individuales y temperamento. No diagnostica ni etiqueta.', Icons.child_care),
          _buildMenu(context, 'COMPRENDO SU DESARROLLO', 'Contenido adaptado a la etapa de edad: desarrollo, comunicación, movimiento, autonomía, juego y relaciones.', Icons.psychology),
          _buildMenu(context, 'COMPRENDO SUS EMOCIONES', 'Ayuda para comprender qué puede estar ocurriendo y cómo responder.', Icons.favorite),
          _buildMenu(context, 'CULTIVO CAPACIDADES PARA LA VIDA', 'Experiencias para fortalecer autonomía, empatía, respeto, responsabilidad, perseverancia, comunicación, cooperación, autorregulación y resolución de conflictos.', Icons.self_improvement),
          _buildMenu(context, 'AYÚDAME, MI HIJO...', 'Orientación rápida para rabietas, llanto, golpes, mordidas, miedo, celos, gritos, compartir, pantallas, sueño, alimentación, separación y otras situaciones.', Icons.help_outline),
          _buildMenu(context, '¿CUÁNDO DEBO CONSULTAR?', 'Orientación preventiva con señales de atención y recomendación de consulta profesional, sin diagnosticar.', Icons.medical_services_outlined),
          _buildMenu(context, 'DIARIO DE CRECIMIENTO', 'Registro de observaciones y progresos a través del tiempo.', Icons.book_outlined),
          _buildMenu(context, 'MAPA DE ACOMPAÑAMIENTO', 'Síntesis de características observadas y estrategias útiles, sin convertirlas en etiquetas.', Icons.map_outlined),
          _buildMenu(context, 'YO TAMBIÉN ME OBSERVO', 'Espacio para que el adulto identifique cómo se siente y cómo responde.', Icons.person_outline),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text('Motor Metodológico:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('OBSERVAR → COMPRENDER → RESPONDER → FORTALECER → OBSERVAR EL PROGRESO', textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, String titulo, String subtitulo, IconData icono) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icono, color: const Color(0xFF4A7C59)),
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitulo, style: const TextStyle(fontSize: 12)),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(titulo: titulo, contenido: subtitulo)));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String titulo;
  final String contenido;
  const DetailScreen({super.key, required this.titulo, required this.contenido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contenido, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('Principios:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('• Cada niño es único\n• Temperamento ≠ destino\n• Todas las emociones pueden ser acompañadas; no todas las conductas pueden ser permitidas\n• Los límites deben ser claros, respetuosos, consistentes\n• La herramienta orienta; no diagnostica'),
          ],
        ),
      ),
    );
  }
}