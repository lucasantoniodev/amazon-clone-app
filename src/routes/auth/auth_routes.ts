import { Router } from "express";
import { signinAuthController } from "../../controllers/auth/signin_auth_controller";
import { signupAuthController } from "../../controllers/auth/signup_auth_controller";

export const authRoutes = Router();

authRoutes.post("/api/signup", signupAuthController.handle);

authRoutes.post("/api/signin", signinAuthController.handle);