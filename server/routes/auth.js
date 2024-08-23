const express = require("express");
const User = require("../models/user.js");
const authRouter = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const dotenv  = require("dotenv");
const { auth } = require("../middlewares/auth.js");
dotenv.config();

authRouter.post('/api/signup', async (req, res) => {
    //Getting data from client
    try {
        const {name, email, password} = req.body;

        const hashedPassword = await bcrypt.hashSync(password, 10)
    
        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({msg: "User Arleady exists"})
        }
    
        let user = new User({
            name, email, password: hashedPassword
        })
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({error: error.message})
    }
    
}) 


// Sign in route
authRouter.post('/api/signin', async(req, res) => {
    try {
        const {email, password} = req.body;

        const user = await User.findOne({email});
        console.log(user);
        if(!user){
            return res.status(400).json({msg: "Invalid Credentials"});
        }

        const isPasswordValid = await bcrypt.compare(password, user.password)
        if(!isPasswordValid){
            return res.status(400).json({msg: "Invalid Credentials"});
        }

        const token = jwt.sign({id: user._id}, process.env.JWT_SECRET_KEY);
        res.json({token, ...user._doc})


    } catch (error) {
        res.status(500).json({error: error.message})
    }


})

// Verify jwt
authRouter.post('/isTokenValid', async(req, res) => {
    try {
        const token = req.header('x-auth-token');
        if(!token){
            return res.json(false)
        }
        const verified = jwt.verify(token, process.env.JWT_SECRET_KEY);
        if(!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);
    } catch (error) {
        res.status(500).json({error: error.message})
    }


})

// Getting user data
authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({...user._doc, token: req.token});
});


module.exports = authRouter;
