import 'dart:convert';

import 'package:rick_and_morty/core/error/exeption.dart';
import 'package:rick_and_morty/features/data/models/person_model.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSource {
  //https://rickandmortyapi.com/api/character/?page=1
  Future<List<PersonModel>> getAllPersons(int page);

  //https://rickandmortyapi.com/api/character/?name=rick
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PersonModel>> getAllPersons(int page) => _getPersonfromUrl(
      "https://rickandmortyapi.com/api/character/?page=$page");

  @override
  Future<List<PersonModel>> searchPerson(String query) => _getPersonfromUrl(
      "https://rickandmortyapi.com/api/character/?name=$query");

  _getPersonfromUrl(String url) async {
    final responce = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (responce.statusCode == 200) {
      final person = json.decode(responce.body);
      return (person["results"] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerExeption();
    }
  }
}
