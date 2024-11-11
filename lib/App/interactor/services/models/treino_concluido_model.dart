class TreinoConcluido {
  String idTreino;
  String titulo;
  String nomeUsuario;
  String fotoPerfilUsuario;
  List<Exercicio> exercicios;

  TreinoConcluido({
    required this.idTreino,
    required this.titulo,
    required this.nomeUsuario,
    required this.fotoPerfilUsuario,
    required this.exercicios,
  });

  factory TreinoConcluido.fromJson(Map<String, dynamic> json) {
    return TreinoConcluido(
      idTreino: json['id_Treino'],
      titulo: json['titulo'],
      nomeUsuario: json['nome_Usuario'],
      fotoPerfilUsuario: json['foto_Perfil_Usuario'],
      exercicios: List<Exercicio>.from(
          json['exercicios'].map((x) => Exercicio.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_Treino': idTreino,
      'titulo': titulo,
      'nome_Usuario': nomeUsuario,
      'foto_Perfil_Usuario': fotoPerfilUsuario,
      'exercicios': List<dynamic>.from(exercicios.map((x) => x.toJson())),
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
          List<String>.from(json['musculos_Sinergistas'].map((x) => x)),
      categoriaExercicio: json['categoria_Exercicio'],
      series: List<Serie>.from(json['series'].map((x) => Serie.fromJson(x))),
      descansoSegundos: json['descanso_Segundos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercicio_Id': exercicioId,
      'nome_Exercicio': nomeExercicio,
      'tipo_Exercicio': tipoExercicio,
      'musculo_Alvo': musculoAlvo,
      'musculos_Sinergistas':
          List<dynamic>.from(musculosSinergistas.map((x) => x)),
      'categoria_Exercicio': categoriaExercicio,
      'series': List<dynamic>.from(series.map((x) => x.toJson())),
      'descanso_Segundos': descansoSegundos,
    };
  }
}

class Serie {
  String tipoSerie;
  double pesoKg;
  int repeticoes;
  bool concluido;

  Serie({
    required this.tipoSerie,
    required this.pesoKg,
    required this.repeticoes,
    required this.concluido,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      tipoSerie: json['tipo_Serie'],
      pesoKg: json['peso_kg'].toDouble(),
      repeticoes: json['repeticoes'],
      concluido: json['concluido'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tipo_Serie': tipoSerie,
      'peso_kg': pesoKg,
      'repeticoes': repeticoes,
      'concluido': concluido,
    };
  }
}
