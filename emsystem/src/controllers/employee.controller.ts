import {
  CountSchema,
  Filter,
  repository
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,

  param,
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {
  Employee
} from '../models';
import {EmployeeRepository} from '../repositories';

export class EmployeeController {
  constructor(
    @repository(EmployeeRepository) protected employeeRepository: EmployeeRepository,
  ) { }

  @get('/employees/list', {
    responses: {
      '200': {
        description: 'Employees List Response',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Employee)},
          },
        },
      },
    },
  })

  async find(
    @param.query.object('filter') filter?: Filter<Employee>,
  ): Promise<Employee[]> {
    return this.employeeRepository.find(
      {
        include: ['titles', 'departments'],
      }
    );
  }

  @get('/employees/{id}', {
    responses: {
      '200': {
        description: 'Get an employee with id',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Employee)},
          },
        },
      },
    },
  })

  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Employee>,
  ): Promise<Employee> {
    return this.employeeRepository.findById(id);
  }

  @post('/employees/', {
    responses: {
      '200': {
        description: 'Employee model instance',
        content: {'application/json': {schema: getModelSchemaRef(Employee)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Employee, {
            title: 'NewEmployee'
          }),
        },
      },
    }) employee: Omit<Employee, 'id'>,
  ): Promise<Employee> {
    return this.employeeRepository.create(employee);
  }

  @patch('/employees/{id}', {
    responses: {
      '204': {
        description: 'Employee update success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Employee, {partial: true}),
        },
      },
    })
    Employee: Partial<Employee>,
  ): Promise<void> {
    await this.employeeRepository.updateById(id, Employee);
  }

  @del('/employees/{id}', {
    responses: {
      '200': {
        description: 'Delete an employee with id.',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.employeeRepository.deleteById(id);
  }
}
