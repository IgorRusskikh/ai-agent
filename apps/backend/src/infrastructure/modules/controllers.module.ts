import { HealthController } from '../controllers/health.controller';
import { Module } from '@nestjs/common';

@Module({
  imports: [],
  controllers: [HealthController],
  providers: [],
})
export class ControllersModule {}
