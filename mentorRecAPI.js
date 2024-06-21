const express = require('express');
const mysql = require('mysql');
const Groq = require('groq-sdk');



const router = express.Router();
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'projek',
    password: 'K43rUL4_4rB0R',
    database: 'DialogueDB'
});

connection.connect(err => {
    if (err) {
        console.error('Error connecting to the database:', err.stack);
        return;
    }
    console.log('Connected to the database.');
});

router.get('/mentorec', async (req, res) => {
    const { userID } = req.query;
    if (!userID) {
        res.status(400).send('userID parameter is required');
        return;
    }

    connection.query('SELECT wordSesi, grammarSesi, listenSesi, pronounSesi FROM SesiMentoring WHERE IdLearner = ?', [userID], async (err, rows, fields) => {
        if (err) {
            console.error('Error executing query:', err.stack);
            res.status(500).send('Error executing query');
            return;
        }

        if (rows.length === 0) {
            res.status(404).send('No sessions found for the given userID');
            return;
        }

        const progressData = rows.map(row => `Word: ${row.wordSesi}, Grammar: ${row.grammarSesi}, Listening: ${row.listenSesi}, Pronunciation: ${row.pronounSesi}`).join('\n');

        try {
            const groq = new Groq({
                apiKey: process.env['GROQ_API_KEY'],
            });

            const prompt = `Analyze the following progress data and provide teaching recommendations and tips for teaching this user in a simple paragraph:\n${progressData}`;
            const chatCompletion = await groq.chat.completions.create({
                messages: [{ role: 'user', content: prompt }],
                model: 'llama3-8b-8192',
            });

            const recommendations = chatCompletion.choices[0].message.content;
            res.send(recommendations);
        } catch (error) {
            console.error('Error generating recommendations:', error);
            res.status(500).send('Error generating recommendations');
        }
    });
});

module.exports = router;
