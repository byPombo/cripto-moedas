class Moeda {
  String? icone;
  String? nome;
  String? sigla;
  double? preco;

  Moeda({
    this.icone,
    this.nome,
    this.sigla,
    this.preco,
  });
  Moeda.empty():
        this.icone = null,
        this.nome = null,
        this.sigla = null,
        this.preco = null;

  factory Moeda.fromJson(Map<String, dynamic> json) => Moeda(
    icone: json["icone"],
    nome: json["nome"],
    sigla: json["sigla"],
    preco: json["preco"].toDouble()
  );

  Map<String, dynamic> toJson() => {
    "icone" : icone,
    "nome" : nome,
    "sigla" : sigla,
    "preco" : preco,
  };
}
