const express = require('express');
const { engine } = require('express-handlebars');
const routes = require('./routes');
const app = express();

app.use(express.json());
app.use(routes);

require('./database')

// Configuração do handlebars
app.engine('handlebars', engine({defaultLayout : 'index'}));
app.set('view engine', 'handlebars');
app.set('views', './views');

app.listen(3030, () => {
    console.log("API RODANDO");
    console.log("http://localhost:3030/")
});