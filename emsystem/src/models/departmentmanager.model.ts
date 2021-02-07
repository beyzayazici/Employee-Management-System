import {Entity, model, property} from '@loopback/repository';


@model({settings: {strict: true}})
export class Departmentmanager extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
    required: true,
  })
  departmentid?: number;

  @property({
    type: 'number',
    required: true,
  })
  managerid?: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Departmentmanager>) {
    super(data);
  }
}

export interface DepartmentmanagerRelations {
  // describe navigational properties here
}

export type DepartmentmanagerWithRelations = Departmentmanager & DepartmentmanagerRelations;
