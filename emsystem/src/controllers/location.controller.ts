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
  Location
} from '../models';
import {LocationRepository} from '../repositories';

export class LocationController {
  constructor(
    @repository(LocationRepository) protected locationRepository: LocationRepository,
  ) { }

  @get('/locations/{locname}', {
    responses: {
      '200': {
        description: 'Array of Location has many Department',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Location)},
          },
        },
      },
    },
  })

  async find(
    @param.path.string('locname') locname: string,
    @param.query.object('filter') filter?: Filter<Location>,
  ): Promise<Location[]> {
    return this.locationRepository.find({include: ['departments'], where: {locname: locname}});
  }
}
