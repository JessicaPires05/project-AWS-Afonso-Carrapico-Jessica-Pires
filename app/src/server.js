const express = require("express");

const app = express();

const practicesRoutes = require("./routes/practices");
const toolsRoutes = require("./routes/tools");
const assessmentsRoutes = require("./routes/assessments");

app.use(express.json());

app.get("/", (req, res) => {
  res.send("TFC Cloud Application");
});

app.use("/practices", practicesRoutes);
app.use("/tools", toolsRoutes);
app.use("/assessments", assessmentsRoutes);

app.listen(3000, () => {
  console.log("Server running on port 3000");
});