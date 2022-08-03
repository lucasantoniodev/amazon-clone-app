import { Request, Response } from "express";
import { SigninAuthService } from "../../services/auth/signin_auth_service";

class SigninAuthController {
    async handle(request: Request, response: Response) {
        const { email, password } = request.body;
        const authService = new SigninAuthService();
    
        const result = await authService.execute({ email, password });

        if (result instanceof Error) {
            return response.status(400).json({ message: result.message });
        }

        return response.json(result);
    }
}

export const signinAuthController = new SigninAuthController();