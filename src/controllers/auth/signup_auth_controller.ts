import { Request, Response } from "express";
import { SignupAuthService } from "../../services/auth/signup_auth_service";

class SignupAuthController {
    async handle(request: Request, response: Response) {
        const { email, password, name } = request.body;

        const userService = new SignupAuthService();
        const userCreated = await userService.execute({ email, password, name });

        if (userCreated instanceof Error) {
            return response.status(400).json({ 
                message: userCreated.message 
            });
        }

        return response.json(userCreated);
    }
}

export const signupAuthController = new SignupAuthController()