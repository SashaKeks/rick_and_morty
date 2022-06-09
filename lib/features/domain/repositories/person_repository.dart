import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(
      int page); //get all persons from  page(1 page have 20 persons)
  Future<Either<Failure, List<PersonEntity>>> searchPerson(
      String query); //search person in persons by NAME
}
