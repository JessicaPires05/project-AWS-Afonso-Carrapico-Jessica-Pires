const express = require("express");

const router = express.Router();

const practices = [
  {
    id: 1,
    name: "Project Management"
  },
  {
    id: 2,
    name: "Quality Assurance"
  }
];

router.get("/", (req, res) => {
  res.json(practices);
});

module.exports = router;