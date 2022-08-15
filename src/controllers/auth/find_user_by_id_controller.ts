import { Request, Response } from "express";

import { FindUserByIDService } from "../../services/auth/find_user_by_id_service";

class FindUserByIDController {
    async handle(request: Request, response: Response) {
        const { id } = request.body
   
        const findUserService = new FindUserByIDService();
        const result = await findUserService.execute(id);

        if (result instanceof Error) {
            return response.status(500).json({ error: result.message })
        }

        if (!result) {
            return response.status(401).json(false)
        }

        return response.json({ user: result,  token: request.headers['x-auth-token']})
    }
}

export const findUserByIDController = new FindUserByIDController()