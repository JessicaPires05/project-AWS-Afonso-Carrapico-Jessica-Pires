const express = require("express");

const router = express.Router();

const tools = [
  {
    id: 1,
    practiceId: 1,
    name: "Jira"
  },
  {
    id: 2,
    practiceId: 2,
    name: "SonarQube"
  }
];

router.get("/", (req, res) => {
  res.json(tools);
});

module.exports = router;