import {belongsTo, Entity, hasOne, model, property} from '@loopback/repository';
import {Department} from './department.model';
import {Departmentmanager} from './departmentmanager.model';
import {Title} from './title.model';

@model({settings: {strict: true}})
export class Employee extends Entity {
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
  name: string;

  @property({
    type: 'string',
    required: true,
  })
  surname: string;

  @property({
    type: 'string',
    required: true,
  })
  email: string;

  @property({
    type: 'string',
    required: true,
  })
  phonenumber: string;

  @property({
    type: 'date',
    required: true,
  })
  startdate: string;

  @property({
    type: 'number',
    required: true,
  })
  salary: number;

  @property({
    type: 'number',
    required: true,
  })
  departmentid: number;

  @property({
    type: 'number',
    required: true,
  })
  titleid: number;

  @property({
    type: 'number',
    required: true,
  })
  managerid: number;

  @hasOne(() => Departmentmanager, {keyTo: 'managerid'})
  departmentmanager: Departmentmanager;

  @belongsTo(() => Department, {name: 'departments'})
  departmentId: number;

  @belongsTo(() => Title, {name: 'titles'})
  titleId: number;
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Employee>) {
    super(data);
  }
}

export interface EmployeeRelations {
  // describe navigational properties here
}

export type EmployeeWithRelations = Employee & EmployeeRelations;
