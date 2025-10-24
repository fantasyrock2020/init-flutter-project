abstract class BaseDataMapper<Model, Entity> {
  // const BaseDataMapper();

  Entity mapToEntity(Model? data);

  Model mapToModel(Entity entity);

  List<Entity> mapToListEntity(List<Model>? listModel) {
    return listModel?.map(mapToEntity).toList() ?? List<Entity>.empty();
  }

  List<Model> mapToListModel(List<Entity> listEntity) {
    return listEntity.map(mapToModel).toList();
  }
}
