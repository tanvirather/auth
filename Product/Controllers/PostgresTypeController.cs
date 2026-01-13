using Microsoft.AspNetCore.Mvc;
using Zuhid.Base;
using Zuhid.Product.Entities;
using Zuhid.Product.Mappers;
using Zuhid.Product.Models;
using Zuhid.Product.Repositories;

namespace Zuhid.Product.Controllers;

[Route("[controller]")]
public class PostgresTypeController(PostgresTypeRepository repository, PostgresTypeMapper mapper) :
  BaseCrudController<PostgresTypeRepository, PostgresTypeMapper, ProductContext, PostgresTypeModel, PostgresTypeEntity>(repository, mapper) {

  // [NonAction]
  // public override Task Delete(Guid id) => throw new NotSupportedException();
}
