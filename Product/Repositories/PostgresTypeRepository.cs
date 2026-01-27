using Zuhid.Base;
using Zuhid.Product.Entities;
using Zuhid.Product.Models;

namespace Zuhid.Product.Repositories;

public class PostgresTypeRepository(ProductContext context) : BaseRepository<ProductContext, PostgresTypeModel, PostgresTypeEntity>(context) {
  protected override IQueryable<PostgresTypeModel> Query => _context.PostgresTypes.Select(entity => new PostgresTypeModel {
    Id = entity.Id
  });
}

