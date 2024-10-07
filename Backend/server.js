const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());  // Allows requests from other origins, like Flutter's local development
app.use(bodyParser.json());  // Parses incoming JSON request bodies

// Route for handling registration
app.post('/register', (req, res) => {
    const { fullName, email, password, studentId } = req.body;

    // Log the incoming registration data
    console.log(`Full Name: ${fullName}, Email: ${email}, Password: ${password}, Student ID: ${studentId}`);

    // Simulate account creation success
    if (fullName && email && password && studentId) {
        res.status(200).json({ message: 'Account created successfully!' });
    } else {
        res.status(400).json({ message: 'Invalid input' });
    }
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
