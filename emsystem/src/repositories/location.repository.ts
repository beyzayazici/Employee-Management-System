import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {PsqlDsDataSource} from '../datasources';
import {Location, LocationRelations, Department} from '../models';
import {DepartmentRepository} from './department.repository';

export class LocationRepository extends DefaultCrudRepository<
  Location,
  typeof Location.prototype.id,
  LocationRelations
> {

  public readonly departments: HasManyRepositoryFactory<Department, typeof Location.prototype.id>;

  constructor(
    @inject('datasources.psqlDs') dataSource: PsqlDsDataSource, @repository.getter('DepartmentRepository') protected departmentRepositoryGetter: Getter<DepartmentRepository>,
  ) {
    super(Location, dataSource);
    this.departments = this.createHasManyRepositoryFactoryFor('departments', departmentRepositoryGetter,);
    this.registerInclusionResolver('departments', this.departments.inclusionResolver);
  }
}
