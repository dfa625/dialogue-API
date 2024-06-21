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

router.get('/modul', (req, res) => {
    connection.query('SELECT teksModul, kategoriModul, mp3Modul FROM Modul', (err, rows, fields) => {
        if (err) {
            console.error('Error executing query:', err.stack);
            res.status(500).send('Error executing query');
            return;
        }

        const modules = rows.map(row => ({
            teks: row.teksModul,
            kategori: row.kategoriModul,
            sound: row.mp3Modul
        }));
        res.json(modules);
    });
});


router.get('/example', async (req, res) => {
    const { teks } = req.query;
    if (!teks) {
        res.status(400).send('teks parameter is required');
        return;
    }

    try {
        const groq = new Groq({
            apiKey: process.env['GROQ_API_KEY'],
            
        });

        const chatCompletion = await groq.chat.completions.create({
            messages: [{ role: 'system', content: `Write a sentence using the word '${teks}'` }],
            model: 'llama3-8b-8192',
        });

        const exampleSentence = chatCompletion.choices[0].message.content;
        res.json({ teks, exampleSentence });
    } catch (error) {
        console.error('Error generating example sentence:', error);
        res.status(500).send('Error generating example sentence');
    }
});

module.exports = router;
