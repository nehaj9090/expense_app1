part of 'cat_bloc.dart';

@immutable
abstract class CatEvent {}


class GetCategoriesEvent extends CatEvent{

}

class AddCategoriesEvent extends CatEvent{

}