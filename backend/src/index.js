const express = require("express");

const app = express();
const port = process.env.PORT || 4000;

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.listen(port, () => {
  console.log(`backend placeholder server listening on port ${port}`);
});
