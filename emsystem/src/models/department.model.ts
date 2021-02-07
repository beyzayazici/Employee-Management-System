import {Entity, hasMany, hasOne, model, property} from '@loopback/repository';
import {Departmentmanager} from './departmentmanager.model';
import {Employee} from './employee.model';
import {Title} from './title.model';

@model({settings: {strict: true}})
export class Department extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  depname: string;

  @property({
    type: 'number',
    required: true,
  })
  locationid: number;

  @hasMany(() => Title, {keyTo: 'departmentid'})
  titles: Title[];

  @hasMany(() => Employee, {keyTo: 'departmentid'})
  employees: Employee[];

  @hasOne(() => Departmentmanager, {keyTo: 'departmentid'})
  departmentmanager: Departmentmanager;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Department>) {
    super(data);
  }
}

export interface DepartmentRelations {
  // describe navigational properties here
}

export type DepartmentWithRelations = Department & DepartmentRelations;
