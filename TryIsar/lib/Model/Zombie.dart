import 'package:isar/isar.dart';

part 'Zombie.g.dart';

@Collection()
class Zombie{
  Id id = Isar.autoIncrement;

  @Name('ZombieHp')
  String? ZombieHp;

  @Name('ZombieAttackSpeed')
  String? ZombieAttackSpeed;

  @Name('Attack')
  String? ZombieAttack;
  
  @Name('ZombieName')
  String? ZombieName;

  @Name('CreateDateTime')
  String? CreateDateTime;

  @Name('ImagePath')
  String? ImagePath ;
}