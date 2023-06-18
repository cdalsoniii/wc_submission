import * as functions from "firebase-functions";
const cors = require('cors')({ origin: true });

exports.testWeatherData = functions.https.onRequest((req, res) => {
  cors(req, res, () => {
    // Handle the request
    // ...

    // Set CORS headers
    res.set('Access-Control-Allow-Origin', '*');
    res.set('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.set('Access-Control-Allow-Headers', 'Content-Type');

    // Send the response
    res.send('Hello, world!');
  });
});