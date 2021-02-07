import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {PsqlDsDataSource} from '../datasources';
import {Title, TitleRelations, Employee} from '../models';
import {EmployeeRepository} from './employee.repository';

export class TitleRepository extends DefaultCrudRepository<
  Title,
  typeof Title.prototype.id,
  TitleRelations
> {

  public readonly employees: HasManyRepositoryFactory<Employee, typeof Title.prototype.id>;

  constructor(
    @inject('datasources.psqlDs') dataSource: PsqlDsDataSource, @repository.getter('EmployeeRepository') protected employeeRepositoryGetter: Getter<EmployeeRepository>,
  ) {
    super(Title, dataSource);
    this.employees = this.createHasManyRepositoryFactoryFor('employees', employeeRepositoryGetter,);
    this.registerInclusionResolver('employees', this.employees.inclusionResolver);
  }
}
