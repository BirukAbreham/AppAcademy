const express = require("express");

// database imports
const mongoose = require("mongoose");
const db = require("./config/keys").mongoURI;

// authentication imports
const passport = require("passport");

// route imports
const users = require("./routes/api/users");
const tweets = require("./routes/api/tweets");

// database connection
mongoose
  .connect(db, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch((error) => console.log(error));

const app = express();

// The passport middleware
require("./config/passport")(passport);
app.use(passport.initialize());

app.use("/api/users", users);
app.use("/api/tweets", tweets);

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server is running on port ${port}`));
