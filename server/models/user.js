const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name:{
        type: String,
        require: true,
        trim: true,

    },
    email:{
        required: true,
        type: String,
        trim: true,
        validate: {
            validator:(value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please Enter A Valid Email Address"
        }
    },

    password: {
        required: true,
        type: String,
        // validate:{
        //     validator: (value) => {
        //         return value.length > 6;
        //     },
        //     message: "Password should be greator than 6 Characters"
        // }
    },

    address: {
        type: String,
        default: '',
    },

    type: {
        type: String,
        default: 'user',
    },

    // Cart
}, { timestamps: true })

const User = mongoose.model("User", userSchema)
module.exports = User;