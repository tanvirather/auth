namespace Zuhid.Base;

public class BaseMapper<TModel, TEntity>
 where TModel : new()
 where TEntity : new() {
  public virtual TEntity GetEntity(TModel model) {
    return GetObject<TModel, TEntity>(model);
  }

  public virtual TModel GetModel(TEntity entity) {
    return GetObject<TEntity, TModel>(entity);
  }

  public List<TEntity> GetEntityList(List<TModel> modelList) {
    return GetList<TModel, TEntity>(modelList);
  }

  public List<TModel> GetModelList(List<TEntity> entityList) {
    return GetList<TEntity, TModel>(entityList);
  }

  private static TDestination GetObject<TSource, TDestination>(TSource model) where TDestination : new() {
    if (typeof(TDestination).IsAssignableFrom(typeof(TSource))) {
      return (TDestination)(object)model;
    }

    var modelProperities = typeof(TSource).GetProperties();
    var entityProperities = typeof(TDestination).GetProperties();
    var entity = new TDestination();
    foreach (var entityProperity in entityProperities) {
      var modelProperity = modelProperities.FirstOrDefault(sourceProperity => entityProperity.Name == sourceProperity.Name);
      if (modelProperity != null) {
        entityProperity.SetValue(entity, modelProperity.GetValue(model, null), null);
      }
    }
    return entity;
  }

  private static List<TDestination> GetList<TSource, TDestination>(List<TSource> sourceList) where TDestination : new() {
    if (typeof(TDestination).IsAssignableFrom(typeof(TSource))) {
      return [.. sourceList.Cast<TDestination>()];
    }
    var modelList = new List<TDestination>();
    sourceList.ForEach(source => modelList.Add(GetObject<TSource, TDestination>(source)));
    return modelList;
  }


}
