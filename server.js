const express = require("express");
const mysql = require("mysql");

//CONSTANTS
const ALL_INFO = `SELECT * FROM students 
INNER JOIN mobile_numbers ON mobile_numbers.s_id = students.s_id
INNER JOIN student_has_course ON student_has_course.s_id = students.s_id 
INNER JOIN courses ON courses.c_id = student_has_course.c_id 
INNER JOIN departments ON students.dept_id = departments.dept_id
INNER JOIN student_has_assignment ON student_has_assignment.s_id = students.s_id
INNER JOIN assignments ON student_has_assignment.a_id = assignments.a_id`;

const db = mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "root",
    password: "",
    database: "student_management", // Temp Database
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log("MySQL Connected...");
});

const app = express();

//Default route: Sends list of all students
app.get("/", (req, res) => {
    let sql = "SELECT * FROM students";
    db.query(sql, (err, result) => {
        if (err) throw err;
        console.log(result);
        res.send(result);
    });
});

// Admin Page: Lists all students
app.get("/admin", (req, res) => {
    db.query(ALL_INFO, (err, result) => {
        if (err) throw err;
        console.log(result);
        res.send(result);
    });
});

// Get Specific Student Data
app.get("/student/:id", (req, res) => {
    // TODO: Add functionality to access ALL student data with specific registration number
    let sql = ALL_INFO + ` WHERE students.s_id = ${req.params.id}`;
    db.query(sql, (err, result) => {
        if (err) throw err;
        console.log(result);
        res.send(result);
    });
});

const port = 5000;

app.listen(port, () => console.log(`Server started on port ${port}`));
