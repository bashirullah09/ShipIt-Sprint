
const express = require("express");

const app = express();
const PORT = 3001;

app.use(express.json());

// Main API endpoint
app.get("/api", (req, res) => {
    res.json({
        message: "Welcome to ShipIt Sprint API",
        status: "running"
    });
});

// Health check endpoint
app.get("/api/health", (req, res) => {
    res.json({
        status: "healthy",
        uptime: process.uptime()
    });
});

// Information endpoint
app.get("/api/info", (req, res) => {
    res.json({
        project: "ShipIt Sprint",
        application: "Node.js Express API",
        version: "1.0.0"
    });
});

app.listen(PORT, "127.0.0.1", () => {
    console.log(`ShipIt Sprint API running on port ${PORT}`);
});

