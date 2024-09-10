const express = require('express');  // express modülünü gösterme
const BookRouter = require('./router/Router.js')  //Router kısmını tanımlama
const app = express()  //express modülünü app değişkenine tanımlama
const winston = require('winston');  //loglama işlemleri için winston mmodülünü çağırma
const elasticClient = require('./elasticsearch/elasticClient');  //elasticsearchı tanmlama
const cors = require('cors');  //cors modülünü tanımlama


//middlewares
app.use(cors());
app.use(express.json())

//loglama işlemleri burada yapılır
const logger = winston.createLogger({
    level: 'info',
    format: winston.format.json(),
    defaultMeta: { service: 'user-service' },
    transports: [
      //
      // - Write all logs with importance level of `error` or less to `error.log`
      // - Write all logs with importance level of `info` or less to `combined.log`
      //
      new winston.transports.File({ filename: 'error.log', level: 'error' }),
      new winston.transports.File({ filename: 'combined.log' }),
    ],
  });

  //
// If we're not in production then log to the `console` with the format:
// `${info.level}: ${info.message} JSON.stringify({ ...rest }) `
//
logger.error("Hata Yakaladım")

// elasticClient.ping({    
//     requestTimeout: 1000
// }, function (error) {
//     if (error) {
//         console.trace('Elasticsearch\'e erişilmiyor!');
//     } else {
//         console.log('Elasticsearch ayakta :)');
//     }
// });



app.get('/', (req, res) => {
    res.send("Hello World")
})

const port = 5000
app.listen(port, () => {
    console.log(`Server is running on ${port} port`)
})

app.use('/api',BookRouter)