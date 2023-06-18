import { NextApiRequest, NextApiResponse } from 'next';

import { createClient } from '@supabase/supabase-js'
var axios = require('axios');
const { MongoClient, ServerApiVersion } = require('mongodb');

// Create a single supabase client for interacting with your database
const supabase = createClient(
  // Add the process.env.SUPABASE_URL and process.env.SUPABASE_KEY variables to your .env file
  process.env.SUPABASE_URL as string,
  process.env.SUPABASE_API_TOKEN as string
)


export const writeMongo = async (zipcode: number, opinion: string) => {

  const uri = process.env.MONGO_URI;
  console.log("uri", uri);
// Create a MongoClient with a MongoClientOptions object to set the Stable API version
const client = new MongoClient(uri, {
  serverApi: {
    version: ServerApiVersion.v1,
    strict: true,
    deprecationErrors: true,
  }
});
  
async function run() {
  try {
    // Connect the client to the server	(optional starting in v4.7)
    await client.connect();
    // Send a ping to confirm a successful connection
    await client.db("admin").command({ ping: 1 });
    console.log("Pinged your deployment. You successfully connected to MongoDB!");
    const myDB = client.db("test");

    const myColl = myDB.collection("weathers");

    const doc = { zipcode: zipcode, opinion: opinion };
    const result = await myColl.insertOne(doc);
    console.log(
      `A document was inserted with the _id: ${result.insertedId}`,
    );
  } finally {
    // Ensures that the client will close when you finish/error
    await client.close();
  }
}
run().catch(console.dir);
};

// Create a function that writes to the database table weather data the opinion of the user on the temperature
export const writeOpinion = async (zipcode: number, opinion: string) => {
  const { data, error } = await supabase
    .from('weatherData')

    .insert([
      { zipcode: zipcode, opinion: opinion },
    ]);
  console.log("data", data);
  console.log("error", error);
};


const allowCors = (fn: (req: NextApiRequest, res: NextApiResponse) => Promise<void>) => async (
  req: NextApiRequest,
  res: NextApiResponse
) => {
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
  );
  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }
  await fn(req, res);
};

// create a function to get the forecast from the weather API
export const getForecast = async (zipcode: number) => {

  const apiKey = process.env.WEATHER_API_TOKEN;
  console.log("apiKey", apiKey);
  // interpolate the api key into  url string

  const url = `https://api.weatherapi.com/v1/forecast.json?key=`
    + apiKey
    + `&q=`
    + zipcode
    + `&days=1&aqi=yes&alerts=yes`;
  
  //const url =`https://webhook.site/be3422e4-9026-4818-85e0-4e68a04e7f09`
  const res = await fetch(url);
  const json = await res.json();
  //console.log("json", json);  

  return json;
};

const handler = async (req: NextApiRequest, res: NextApiResponse) => {

  const { body } = req;
  console.log("body", body, "body json: ", JSON.stringify(body));
  // parse body to json
  
  //const body_json = JSON.parse(body);
  const body_json = body;
  console.log('body json:', body_json);
  console.log(body_json.opinion, body_json.zipCode)
  //console.log('zipcode:', body_json['zipCode']);
  const forecast_data = await getForecast(body_json['zipCode']);
  const writeRes = writeOpinion(body_json['zipCode'], body_json['opinion']);
  writeMongo(body_json['zipCode'], body_json['opinion'])
  
  console.log("forecas data", forecast_data);

  res.status(200).json(forecast_data['forecast']);

};

export default allowCors(handler);
