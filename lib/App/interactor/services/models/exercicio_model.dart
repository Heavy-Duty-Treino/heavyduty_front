class ExercicioModel {
  final String id;
  final String nome_exercicio;
  final String image_Url;
  final String nome_usuario;
  final String tipo_exercicio;
  final String musculo_alvo;
  final List<dynamic> musculos_sinergistas;
  final String categoria_exercicio;

  ExercicioModel(
      {required this.id,
      required this.nome_exercicio,
      required this.image_Url,
      required this.nome_usuario,
      required this.tipo_exercicio,
      required this.musculo_alvo,
      required this.musculos_sinergistas,
      required this.categoria_exercicio});
}
