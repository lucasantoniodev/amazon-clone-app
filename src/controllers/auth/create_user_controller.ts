import { Request, Response } from "express";
import { CreateUserService } from "../../services/auth/create_user_service";

class CreateUserController {
    async handle(request: Request, response: Response) {
        const { email, password, name } = request.body;

        const userService = new CreateUserService();
        const userCreated = await userService.execute({ email, password, name });

        if (userCreated instanceof Error) {
            return response.status(400).json({ message: userCreated.message });
        }

        return response.json(userCreated);
    }
}

export const createUserController = new CreateUserController()