const express = require('express');
// import express from 'express'
const mysql = require('mysql');
const chalk = require('chalk');




// user Create connection
const db = mysql.createConnection({
    host : 'cp2.infonet.hr',
    user : 'ucimeu96_test',
    port: '3306',
    password : 'l07RC4qY0MSF',
    database : 'ucimeu96_test'     
});



setInterval(function () {
    console.log('Prespajam svakih 15 sekundi');
    db.query('SELECT 1');
}, 15000);


// Connect
db.connect((err) => {
    if(err){
        throw err;
    }
    console.log('MySql Connected...');
});

const app = express();

// Create DB
app.get('/createdb', (req, res) => {
    let sql = 'CREATE DATABASE nodemysql';
    db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Database created...');
    });
});

// Create table
app.get('/createpoststable', (req, res) => {
    let sql = 'CREATE TABLE posts(id int AUTO_INCREMENT, title VARCHAR(255), body VARCHAR(255), PRIMARY KEY(id))';
    db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Posts table created...');
    });
});

// Insert post 
app.get('/addpost', (req, res) => {
    let br = Math.random();
    let post = {title:'Post One', body:`This is post xxx ${br} ${new Date()}`};
    let sql = 'INSERT INTO posts SET ?';
    let query = db.query(sql, post, (err, result) => {
        if(err) throw err;
        console.log(chalk.green.inverse('Upisao u bazu jedan zapis'));
        console.log(result);
        res.send('Post 1 added...');
    });
});

// Select posts
app.get('/getposts', (req, res) => {
    let sql = 'SELECT * FROM posts';
    let query = db.query(sql, (err, results) => {
        if(err) throw err;
        console.log(chalk.green.inverse('Pzikazuje sve zapis'));
        console.log(results);
        res.send('Posts fetched...');
    });
});

// Select single post
app.get('/getpost/:id', (req, res) => {
    let sql = `SELECT * FROM posts WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(chalk.green.inverse('Jedan zapis:'));
        console.log(result);
        res.send('Post fetched...');
    });
});

// Update post
app.get('/updatepost/:id', (req, res) => {
    let newTitle = 'Updated Title';
    let sql = `UPDATE posts SET title = '${newTitle}' WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Post updated...');
    });
});

// Delete post
app.get('/deletepost/:id', (req, res) => {
    let newTitle = 'Updated Title';
    let sql = `DELETE FROM posts WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Post deleted..');
    });
});




app.listen('3000', () => {
    console.log('Server started on port 3000');
});