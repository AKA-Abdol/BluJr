import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { Observable } from 'rxjs';
import mongoose from 'mongoose';

@Injectable()
export class AuthGaurd implements CanActivate {
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    const request: any = context.switchToHttp().getRequest();
    const userId: string =
      (request.headers.authorization ?? '').split(' ')[1] ?? '';
    if (!mongoose.Types.ObjectId.isValid(userId)) return false;
    context.switchToHttp().getRequest().userId = userId;
    return true;
  }
}
