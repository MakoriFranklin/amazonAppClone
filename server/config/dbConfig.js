const mongoose = require('mongoose')

const connectToDB = async () => {
    await mongoose.connect(process.env.MONGOURL).then(() => {
        console.log("Connected to db")
    }).catch((e)=>{
        console.log(e)
    })
}

module.exports = connectToDB;