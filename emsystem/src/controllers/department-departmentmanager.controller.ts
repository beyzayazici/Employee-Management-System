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
  Department,
  Departmentmanager,
} from '../models';
import {DepartmentRepository} from '../repositories';

export class DepartmentDepartmentmanagerController {
  constructor(
    @repository(DepartmentRepository) protected departmentRepository: DepartmentRepository,
  ) { }

  @get('/departments/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Department has one Departmentmanager',
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
    return this.departmentRepository.departmentmanager(id).get(filter);
  }

  @post('/departments/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Department model instance',
        content: {'application/json': {schema: getModelSchemaRef(Departmentmanager)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Department.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Departmentmanager, {
            title: 'NewDepartmentmanagerInDepartment',
            exclude: ['id'],
            optional: ['departmentId']
          }),
        },
      },
    }) departmentmanager: Omit<Departmentmanager, 'id'>,
  ): Promise<Departmentmanager> {
    return this.departmentRepository.departmentmanager(id).create(departmentmanager);
  }

  @patch('/departments/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Department.Departmentmanager PATCH success count',
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
    return this.departmentRepository.departmentmanager(id).patch(departmentmanager, where);
  }

  @del('/departments/{id}/departmentmanager', {
    responses: {
      '200': {
        description: 'Department.Departmentmanager DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Departmentmanager)) where?: Where<Departmentmanager>,
  ): Promise<Count> {
    return this.departmentRepository.departmentmanager(id).delete(where);
  }
}
