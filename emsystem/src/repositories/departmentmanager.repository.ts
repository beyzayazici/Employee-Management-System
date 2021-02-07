import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {PsqlDsDataSource} from '../datasources';
import {Departmentmanager, DepartmentmanagerRelations} from '../models';

export class DepartmentmanagerRepository extends DefaultCrudRepository<
  Departmentmanager,
  typeof Departmentmanager.prototype.id,
  DepartmentmanagerRelations
> {
  constructor(
    @inject('datasources.psqlDs') dataSource: PsqlDsDataSource,
  ) {
    super(Departmentmanager, dataSource);
  }
}
