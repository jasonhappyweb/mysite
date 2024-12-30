import 'package:isar/isar.dart';

part 'Page1.g.dart';

@Collection()
class Page1{
    Id id = Isar.autoIncrement;
    @Name('USerNMC')
    String? UserNMC;

    @Name('Times')
    String? Times;
    @Name('People')
    String? People;
    @Name('Talk')
    String? Talk;
    @Name('Line')
    String? Line;
}