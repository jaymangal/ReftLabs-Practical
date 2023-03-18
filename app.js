require("dotenv").config();
const compression = require("compression");
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const routes = require("./routes/main.routes");
const { print } = require("./routes/listing");
const app = express();

app.use(express.static("./public"));
app.use(cors());
app.use(express.json());
app
  .use(compression({ level: 9 }))
  .use(express.urlencoded({ extended: true }))
  .use(bodyParser.json())
  .use(bodyParser.urlencoded({ extended: true }));

app.use("/api/v1", routes);

app.use(function (req, res, next) {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
  res.setHeader("Access-Control-Allow-Headers", "Content-Type");
  res.setHeader("Access-Control-Allow-Credentials", true);
  next();
});

app.use((req, res) => {
  res.status(404).json({ msg: "Route Not Found", data: null, errors: null });
});

app.listen(process.env.PORT || 8000, () => {
  console.log(`Server started on port: ${process.env.PORT || 8000}`);
});

app._router.stack.forEach(print.bind(null, []));
