import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyRepositoryFactory, HasOneRepositoryFactory} from '@loopback/repository';
import {PsqlDsDataSource} from '../datasources';
import {Department, DepartmentRelations, Title, Employee, Departmentmanager} from '../models';
import {TitleRepository} from './title.repository';
import {EmployeeRepository} from './employee.repository';
import {DepartmentmanagerRepository} from './departmentmanager.repository';

export class DepartmentRepository extends DefaultCrudRepository<
  Department,
  typeof Department.prototype.id,
  DepartmentRelations
> {

  public readonly titles: HasManyRepositoryFactory<Title, typeof Department.prototype.id>;

  public readonly employees: HasManyRepositoryFactory<Employee, typeof Department.prototype.id>;

  public readonly departmentmanager: HasOneRepositoryFactory<Departmentmanager, typeof Department.prototype.id>;

  constructor(
    @inject('datasources.psqlDs') dataSource: PsqlDsDataSource, @repository.getter('TitleRepository') protected titleRepositoryGetter: Getter<TitleRepository>, @repository.getter('EmployeeRepository') protected employeeRepositoryGetter: Getter<EmployeeRepository>, @repository.getter('DepartmentmanagerRepository') protected departmentmanagerRepositoryGetter: Getter<DepartmentmanagerRepository>,
  ) {
    super(Department, dataSource);
    this.departmentmanager = this.createHasOneRepositoryFactoryFor('departmentmanager', departmentmanagerRepositoryGetter);
    this.registerInclusionResolver('departmentmanager', this.departmentmanager.inclusionResolver);
    this.employees = this.createHasManyRepositoryFactoryFor('employees', employeeRepositoryGetter,);
    this.registerInclusionResolver('employees', this.employees.inclusionResolver);
    this.titles = this.createHasManyRepositoryFactoryFor('titles', titleRepositoryGetter,);
    this.registerInclusionResolver('titles', this.titles.inclusionResolver);
  }
}
