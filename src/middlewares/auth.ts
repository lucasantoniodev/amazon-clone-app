import jwt from 'jsonwebtoken';

export const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.status(403).json({ message: "No auth token, access denied" });

        const secretKey = process.env.SECRET_KEY as string
        const decoded = jwt.verify(token, secretKey);
        req.body = decoded;
        next()
    } catch (error) {
        res.status(400).json({ message: error.message })
    }
}