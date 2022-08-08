import mongoose, { Schema } from "mongoose";


const userSchema = new Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value: string) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'Please enter a valid email address'
        }
    },
    password: {
        required: true,
        type: String,
        validate: {
            validator: (value: string) => {
                return value.length >= 8;
            },
            message: "Please enter a long password. Minimun 8 Characters"
        }
    },
    address: {
        type: String,
        default: ""
    },
    type: {
        type: String,
        default: "user"
    }

});

export const User = mongoose.model("User", userSchema);

// export const validate = (user: UserRequest) => {
//     const schema = Joi.object({
//         name: Joi.string().required(),
//         email: Joi.string().required(),
//         password: Joi.string().required()
//     })

//     return schema.validate(user)
// }