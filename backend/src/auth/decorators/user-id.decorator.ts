import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const UserId = createParamDecorator(
  (_data: any, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();

    if (!request || !request.user || !request.user.id) {
      throw new Error('User not found in request');
    }

    return request.user.id;
  },
);
