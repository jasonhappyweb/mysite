import 'package:isar/isar.dart';

part 'Plant.g.dart';

@Collection()
class Plant{
  Id id = Isar.autoIncrement;

  @Name('PlantHp')
  String? PlantHp;

  @Name('PlantAttackSpeed')
  String? PlantAttackSpeed;

  @Name('PlantAttack')
  String? PlantAttack;

  @Name('PlantName')
  String? PlantName;

  @Name('CreateDateTime')
  String? CreateDateTime ;

  @Name('ImagePath')
  String? ImagePath ;
}