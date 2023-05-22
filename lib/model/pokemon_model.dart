class Pokemon {
  final String name;
  final String frontImageUrl;
  final String backImageUrl;
  final List<String> abilities;
  final int weight;
  final int height;
  final int order;
  final int baseExperience;
  final List<String> types;

  Pokemon({
    required this.name,
    required this.frontImageUrl,
    required this.backImageUrl,
    required this.abilities,
    required this.weight,
    required this.height,
    required this.order,
    required this.baseExperience,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      frontImageUrl: json['sprites']['front_default'],
      backImageUrl: json['sprites']['back_default'],
      abilities: List<String>.from(json['abilities'].map((item) => item['ability']['name'])),
      weight: json['weight'],
      height: json['height'],
      order: json['order'],
      baseExperience: json['base_experience'],
      types: List<String>.from(json['types'].map((type) => type['type']['name'])),
    );
  }
}