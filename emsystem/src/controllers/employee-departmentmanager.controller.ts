import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  Employee,
  Departmentmanager,
} from '../models';
import {EmployeeRepository} from '../repositories';

export class EmployeeDepartmentmanagerController {
  constructor(
    @repository(EmployeeRepository) protected employeeRepository: EmployeeRepository,
  ) { }

  @get('/employees/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Employee has one Departmentmanager',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Departmentmanager),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Departmentmanager>,
  ): Promise<Departmentmanager> {
    return this.employeeRepository.departmentmanager(id).get(filter);
  }

  @post('/employees/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Employee model instance',
        content: {'application/json': {schema: getModelSchemaRef(Departmentmanager)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Employee.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Departmentmanager, {
            title: 'NewDepartmentmanagerInEmployee',
            exclude: ['id'],
            optional: ['employeeId']
          }),
        },
      },
    }) departmentmanager: Omit<Departmentmanager, 'id'>,
  ): Promise<Departmentmanager> {
    return this.employeeRepository.departmentmanager(id).create(departmentmanager);
  }

  @patch('/employees/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Employee.Departmentmanager PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Departmentmanager, {partial: true}),
        },
      },
    })
    departmentmanager: Partial<Departmentmanager>,
    @param.query.object('where', getWhereSchemaFor(Departmentmanager)) where?: Where<Departmentmanager>,
  ): Promise<Count> {
    return this.employeeRepository.departmentmanager(id).patch(departmentmanager, where);
  }

  @del('/employees/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Employee.Departmentmanager DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Departmentmanager)) where?: Where<Departmentmanager>,
  ): Promise<Count> {
    return this.employeeRepository.departmentmanager(id).delete(where);
  }
}
