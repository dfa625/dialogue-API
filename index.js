require('dotenv').config({ path: './secret.env' });

const express = require('express');
const app = express();
const port = 3000;

// Import route modules
const modulRoutes = require('./modulAPI');
const userRecRoutes = require('./userRecAPI');
const mentorRecRoutes = require('./mentorRecAPI');


console.log(process.env);
// Use the routes
app.use('/', modulRoutes);
app.use('/', userRecRoutes);
app.use('/', mentorRecRoutes);

app.listen(port, () => {
    console.log(`API listening on port ${port}`);
});

