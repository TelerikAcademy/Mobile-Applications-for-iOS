const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const morgan = require("morgan")

const db = require("./db");

const validator = require("./utils/validator");
const wait = require("./utils/waiter");

let app = express();

app.use(morgan("combined"))

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

app.set("view engine", "pug");

const seconds = 1;

app.get("/", (req, res) => {
    res.render("create");
})

app.get("/api/superheroes", (req, res) => {
    let superheroes = db.get("superheroes")
        .value()
        .map(superhero => {
            return {
                id: superhero.id,
                name: superhero.name,
                imgUrl: superhero.imgUrl
            }
        });

    wait(seconds)
        .subscribe(() => {
            res.send(superheroes);
        });
});

app.get("/api/superheroes/:id", (req, res) => {
    const id = req.params.id;

    let superhero = db.get("superheroes")
        .find({ id })
        .value();

    wait(seconds)
        .subscribe(() => {
            res.send(superhero);
        });
});

app.post("/api/superheroes", (req, res) => {
    let superhero = req.body;
    console.log(superhero);
    const validationResult = validator.isValid(superhero);

    if (!validationResult.isValid) {
        wait(seconds)
            .subscribe(() => {
                res.status(400)
                    .send(validationResult);
            });
        return;
    }

    let id = db.get("superheroes")
        .insert(superhero)
        .write().id
    superhero.id = id;
    wait(seconds)
        .subscribe(() => {
            res.status(201)
                .send(superhero);
        });
});

app.delete("/api/superheroes/:id", (req, res) => {
    db.get("superheroes")
        .remove({ id: req.params.id })
        .write()
    wait(seconds)
        .subscribe(() => {
            res.send(true);
        })
})

const port = 3001;

app.listen(port, () => console.log(`Magic happens on :${port}`)); // eslint-disable-line no-console