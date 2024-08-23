const jwt = require("jsonwebtoken");
const dotenv = require("dotenv")
dotenv.config()
const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if(!token){
            return res.status(401).json({msg: "Not authorized"});
        }
        const verified = jwt.verify(token, process.env.JWT_SECRET_KEY);
        if(!verified) return res.status(401).json({msg: "Your session is timed out"});
        req.user = verified.id;
        req.token = token;
        next();
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}

module.exports = {auth};