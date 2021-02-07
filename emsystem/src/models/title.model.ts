import {Entity, hasMany, model, property} from '@loopback/repository';
import {Employee} from './employee.model';

@model({settings: {strict: true}})
export class Title extends Entity {
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
    type: 'number',
    required: true,
  })
  departmentid: number;

  @hasMany(() => Employee, {keyTo: 'titleid'})
  employees: Employee[];

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Title>) {
    super(data);
  }
}

export interface TitleRelations {
  // describe navigational properties here
}

export type TitleWithRelations = Title & TitleRelations;
