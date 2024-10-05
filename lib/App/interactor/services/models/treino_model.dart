class Treino {
  String id;
  String titulo;
  String nomeUsuario;
  String fotoPerfilUsuario;
  List<Exercicio> exercicios;

  Treino({
    required this.id,
    required this.titulo,
    required this.nomeUsuario,
    required this.fotoPerfilUsuario,
    required this.exercicios,
  });

  factory Treino.fromJson(Map<String, dynamic> json) {
    return Treino(
      id: json['id'],
      titulo: json['titulo'],
      nomeUsuario: json['nome_Usuario'],
      fotoPerfilUsuario: json['foto_Perfil_Usuario'],
      exercicios: (json['exercicios'] as List)
          .map((e) => Exercicio.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'nome_Usuario': nomeUsuario,
      'foto_Perfil_Usuario': fotoPerfilUsuario,
      'exercicios': exercicios.map((e) => e.toJson()).toList(),
    };
  }
}

class Exercicio {
  String exercicioId;
  String nomeExercicio;
  String tipoExercicio;
  String musculoAlvo;
  List<String> musculosSinergistas;
  String categoriaExercicio;
  List<Serie> series;
  int descansoSegundos;

  Exercicio({
    required this.exercicioId,
    required this.nomeExercicio,
    required this.tipoExercicio,
    required this.musculoAlvo,
    required this.musculosSinergistas,
    required this.categoriaExercicio,
    required this.series,
    required this.descansoSegundos,
  });

  factory Exercicio.fromJson(Map<String, dynamic> json) {
    return Exercicio(
      exercicioId: json['exercicio_Id'],
      nomeExercicio: json['nome_Exercicio'],
      tipoExercicio: json['tipo_Exercicio'],
      musculoAlvo: json['musculo_Alvo'],
      musculosSinergistas:
          List<String>.from(json['musculos_Sinergistas'] ?? []),
      categoriaExercicio: json['categoria_Exercicio'],
      series: (json['series'] as List).map((s) => Serie.fromJson(s)).toList(),
      descansoSegundos: json['descanso_Segundos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercicio_Id': exercicioId,
      'nome_Exercicio': nomeExercicio,
      'tipo_Exercicio': tipoExercicio,
      'musculo_Alvo': musculoAlvo,
      'musculos_Sinergistas': musculosSinergistas,
      'categoria_Exercicio': categoriaExercicio,
      'series': series.map((s) => s.toJson()).toList(),
      'descanso_Segundos': descansoSegundos,
    };
  }
}

class Serie {
  String tipoSerie;
  int pesoKg;
  int repeticoes;

  Serie({
    required this.tipoSerie,
    required this.pesoKg,
    required this.repeticoes,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      tipoSerie: json['tipo_Serie'],
      pesoKg: json['peso_kg'],
      repeticoes: json['repeticoes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tipo_Serie': tipoSerie,
      'peso_kg': pesoKg,
      'repeticoes': repeticoes,
    };
  }
}
