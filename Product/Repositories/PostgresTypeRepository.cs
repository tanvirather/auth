using Zuhid.Base;
using Zuhid.Product.Entities;

namespace Zuhid.Product.Repositories;

public class PostgresTypeRepository(ProductContext context) : BaseRepository<ProductContext, PostgresTypeEntity, PostgresTypeEntity>(context) {
  protected override IQueryable<PostgresTypeEntity> Query => _context.PostgresTypes;
}

