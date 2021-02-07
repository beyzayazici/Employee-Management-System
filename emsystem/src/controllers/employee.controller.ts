import {
  Filter,
  repository
} from '@loopback/repository';
import {
  get,
  getModelSchemaRef,
  param
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
}
