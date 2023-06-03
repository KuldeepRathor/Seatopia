const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors');
const jwt = require('jsonwebtoken');
const uuid4 = require('uuid4');
const eventRouter = require('./routes/event.js');

const app = express();
dotenv.config();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());
app.get('/', (req, res) => {
    res.send("Hello, welocme to Seatopia's API");
});

app.use('/api/event', eventRouter);

mongoose.set('strictQuery', false);
mongoose
    .connect(process.env.CONNECTION_URL, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    })
    .then(() => console.log('MongoDB connected successfully'))
    .catch((error) => console.log(`${error} did not connect`));

app.listen(PORT, () =>
    console.log(
        "Hello! This is Seatopia's backend, listening on port - ",
        PORT
    )
);