const express = require("express");

const router = express.Router();

const assessments = [];

router.get("/", (req, res) => {
  res.json(assessments);
});

router.post("/", (req, res) => {
  assessments.push(req.body);

  res.status(201).json(req.body);
});

module.exports = router;