import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Employee,
  Title,
} from '../models';
import {EmployeeRepository} from '../repositories';

export class EmployeeTitleController {
  constructor(
    @repository(EmployeeRepository)
    public employeeRepository: EmployeeRepository,
  ) { }

  @get('/employees/{id}/title', {
    responses: {
      '200': {
        description: 'Title belonging to Employee',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Title)},
          },
        },
      },
    },
  })
  async getTitle(
    @param.path.number('id') id: typeof Employee.prototype.id,
  ): Promise<Title> {
    return this.employeeRepository.titles(id);
  }
}
