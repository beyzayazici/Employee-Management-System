import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasOneRepositoryFactory, repository, BelongsToAccessor} from '@loopback/repository';
import {PsqlDsDataSource} from '../datasources';
import {Departmentmanager, Employee, EmployeeRelations, Department, Title} from '../models';
import {DepartmentmanagerRepository} from './departmentmanager.repository';
import {DepartmentRepository} from './department.repository';
import {TitleRepository} from './title.repository';

export class EmployeeRepository extends DefaultCrudRepository<
  Employee,
  typeof Employee.prototype.id,
  EmployeeRelations
  > {

  public readonly departmentmanager: HasOneRepositoryFactory<Departmentmanager, typeof Employee.prototype.id>;
  department: any;

  public readonly departments: BelongsToAccessor<Department, typeof Employee.prototype.id>;

  public readonly titles: BelongsToAccessor<Title, typeof Employee.prototype.id>;

  constructor(
    @inject('datasources.psqlDs') dataSource: PsqlDsDataSource, @repository.getter('DepartmentmanagerRepository')
    protected departmentmanagerRepositoryGetter: Getter<DepartmentmanagerRepository>, @repository.getter('DepartmentRepository') protected departmentRepositoryGetter: Getter<DepartmentRepository>, @repository.getter('TitleRepository') protected titleRepositoryGetter: Getter<TitleRepository>,
  ) {
    super(Employee, dataSource);
    this.titles = this.createBelongsToAccessorFor('titles', titleRepositoryGetter,);
    this.registerInclusionResolver('titles', this.titles.inclusionResolver);
    this.departments = this.createBelongsToAccessorFor('departments', departmentRepositoryGetter,);
    this.registerInclusionResolver('departments', this.departments.inclusionResolver);
    this.departmentmanager = this.createHasOneRepositoryFactoryFor('departmentmanager', departmentmanagerRepositoryGetter);
    this.registerInclusionResolver('departmentmanager', this.departmentmanager.inclusionResolver);
  }
}
