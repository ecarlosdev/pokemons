import 'package:poke_api/src/shared/shared.dart';

class Specie extends ApiModel {
  final int baseHappiness;
  final int captureRate;
  final NamedApiResource color;
  final List<NamedApiResource> eggGroups;
  final ApiResource evolutionChain;
  final NamedApiResource? evolvesFromSpecies;
  final List<FlavorTextEntry> flavorTextEntries;
  final List<FormDescription> formDescriptions;
  final bool formsSwitchable;
  final int genderRate;
  final List<Genus> genera;
  final NamedApiResource generation;
  final NamedApiResource growthRate;
  final dynamic habitat;
  final bool hasGenderDifferences;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final List<ResourceName> names;
  final int order;
  final List<PalParkEncounter> palParkEncounters;
  final List<PokedexNumber> pokedexNumbers;
  final NamedApiResource shape;
  final List<SpecieVariety> varieties;

  Specie({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  factory Specie.fromJson(Map<String, dynamic> json) => Specie(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: NamedApiResource.fromJson(json["color"]),
        eggGroups: List<NamedApiResource>.from(
            json["egg_groups"].map((x) => NamedApiResource.fromJson(x))),
        evolutionChain: ApiResource.fromJson(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"] == null
            ? null
            : NamedApiResource.fromJson(json["evolves_from_species"]),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions: List<FormDescription>.from(
            json["form_descriptions"].map((x) => FormDescription.fromJson(x))),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        generation: NamedApiResource.fromJson(json["generation"]),
        growthRate: NamedApiResource.fromJson(json["growth_rate"]),
        habitat: json["habitat"],
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: List<ResourceName>.from(
            json["names"].map((x) => ResourceName.fromJson(x))),
        order: json["order"],
        palParkEncounters: List<PalParkEncounter>.from(
            json["pal_park_encounters"]
                .map((x) => PalParkEncounter.fromJson(x))),
        pokedexNumbers: List<PokedexNumber>.from(
            json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
        shape: NamedApiResource.fromJson(json["shape"]),
        varieties: List<SpecieVariety>.from(
            json["varieties"].map((x) => SpecieVariety.fromJson(x))),
      );
}

class FlavorTextEntry {
  final String flavorText;
  final NamedApiResource language;
  final NamedApiResource version;

  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: NamedApiResource.fromJson(json["language"]),
        version: NamedApiResource.fromJson(json["version"]),
      );
}

class FormDescription {
  final String description;
  final NamedApiResource language;

  FormDescription({
    required this.description,
    required this.language,
  });

  factory FormDescription.fromJson(Map<String, dynamic> json) =>
      FormDescription(
        description: json["description"],
        language: NamedApiResource.fromJson(json["language"]),
      );
}

class Genus {
  final String genus;
  final NamedApiResource language;

  Genus({
    required this.genus,
    required this.language,
  });

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: NamedApiResource.fromJson(json["language"]),
      );
}

class PalParkEncounter {
  final NamedApiResource area;
  final int baseScore;
  final int rate;

  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: NamedApiResource.fromJson(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );
}

class PokedexNumber {
  final int entryNumber;
  final NamedApiResource pokedex;

  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  factory PokedexNumber.fromJson(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
        pokedex: NamedApiResource.fromJson(json["pokedex"]),
      );
}

class SpecieVariety {
  final bool? isDefault;
  final NamedApiResource? pokemon;
  final int? baseHappiness;
  final int? captureRate;
  final NamedApiResource? color;
  final List<NamedApiResource>? eggGroups;
  final ApiResource? evolutionChain;
  final NamedApiResource? evolvesFromSpecies;
  final List<FlavorTextEntry>? flavorTextEntries;
  final List<dynamic>? formDescriptions;
  final bool? formsSwitchable;
  final int? genderRate;
  final List<Genus>? genera;
  final NamedApiResource? generation;
  final NamedApiResource? growthRate;
  final NamedApiResource? habitat;
  final bool? hasGenderDifferences;
  final int? hatchCounter;
  final int? id;
  final bool? isBaby;
  final bool? isLegendary;
  final bool? isMythical;
  final String? name;
  final List<ResourceName>? names;
  final int? order;
  final List<PalParkEncounter>? palParkEncounters;
  final List<PokedexNumber>? pokedexNumbers;
  final NamedApiResource? shape;
  final List<VarietyVariety>? varieties;

  SpecieVariety({
    this.isDefault,
    this.pokemon,
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formDescriptions,
    this.formsSwitchable,
    this.genderRate,
    this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  factory SpecieVariety.fromJson(Map<String, dynamic> json) => SpecieVariety(
        isDefault: json["is_default"],
        pokemon: json["pokemon"] == null
            ? null
            : NamedApiResource.fromJson(json["pokemon"]),
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: json["color"] == null
            ? null
            : NamedApiResource.fromJson(json["color"]),
        eggGroups: json["egg_groups"] == null
            ? []
            : List<NamedApiResource>.from(
                json["egg_groups"]!.map((x) => NamedApiResource.fromJson(x))),
        evolutionChain: json["evolution_chain"] == null
            ? null
            : ApiResource.fromJson(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"] == null
            ? null
            : NamedApiResource.fromJson(json["evolves_from_species"]),
        flavorTextEntries: json["flavor_text_entries"] == null
            ? []
            : List<FlavorTextEntry>.from(json["flavor_text_entries"]!
                .map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions: json["form_descriptions"] == null
            ? []
            : List<dynamic>.from(json["form_descriptions"]!.map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: json["genera"] == null
            ? []
            : List<Genus>.from(json["genera"]!.map((x) => Genus.fromJson(x))),
        generation: json["generation"] == null
            ? null
            : NamedApiResource.fromJson(json["generation"]),
        growthRate: json["growth_rate"] == null
            ? null
            : NamedApiResource.fromJson(json["growth_rate"]),
        habitat: json["habitat"] == null
            ? null
            : NamedApiResource.fromJson(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: json["names"] == null
            ? []
            : List<ResourceName>.from(
                json["names"]!.map((x) => ResourceName.fromJson(x))),
        order: json["order"],
        palParkEncounters: json["pal_park_encounters"] == null
            ? []
            : List<PalParkEncounter>.from(json["pal_park_encounters"]!
                .map((x) => PalParkEncounter.fromJson(x))),
        pokedexNumbers: json["pokedex_numbers"] == null
            ? []
            : List<PokedexNumber>.from(
                json["pokedex_numbers"]!.map((x) => PokedexNumber.fromJson(x))),
        shape: json["shape"] == null
            ? null
            : NamedApiResource.fromJson(json["shape"]),
        varieties: json["varieties"] == null
            ? []
            : List<VarietyVariety>.from(
                json["varieties"]!.map((x) => VarietyVariety.fromJson(x))),
      );
}

class VarietyVariety {
  final bool isDefault;
  final NamedApiResource pokemon;

  VarietyVariety({
    required this.isDefault,
    required this.pokemon,
  });

  factory VarietyVariety.fromJson(Map<String, dynamic> json) => VarietyVariety(
        isDefault: json["is_default"],
        pokemon: NamedApiResource.fromJson(json["pokemon"]),
      );
}
