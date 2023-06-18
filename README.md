## Weather Application
> This project is a simple weather application that retrieves US-based weather data from www.weatherapi.com. The application allows users to enter a zip code and retrieve the weather forecast for that location. Additionally, users can provide their opinion on the temperature, and the application will store their input along with the reported temperature from the weather API.

## Technologies Used
The project utilizes the following technologies:

**React**: The application is built using the Flutter framework, which provides a modern and efficient JavaScript library for building user interfaces.

**Node.js**: Node.js is a framework built on top of React that enables server-side rendering and provides features like API routes, making it easier to build full-stack applications.

**MongoDB**: The application utilizes a MongoDB Atlas collection to store the weather data, specifically the user opinions and the reported temperatures.

**Supabase**: Supabase is used as the Postgres database to store the weather data.

## Setup and Configuration
To run the application locally, follow these steps:

1. Clone the repository from GitHub.
2. Install the required dependencies by running `npm install` or `yarn install`.
3. Create a `.env` file in the project's root directory and add the following environment variables:
   - `SUPABASE_URL`: The URL of your Supabase project.
   - `SUPABASE_API_TOKEN`: The API token for your Supabase project.
   - `MONGO_URI`: The connection URI for your MongoDB Atlas cluster.
   - `WEATHER_API_TOKEN`: The API token for accessing the weather API.
4. Start the application by running `npm run dev` or `yarn dev`.

## Functionality
The application provides the following functionality:

- Numeric Text Field: Users can enter a zip code in the numeric text field.
- "Get Forecast" Button: Clicking the button sends the entered zip code to the service gateway, which retrieves the weather forecast using the weather API.
- Weather Display: The application displays the results of the API call, including the daily high and low temperatures, weather conditions, rainfall, etc.
- User Temperature Input: An additional input field allows users to report their perception of the current temperature.
- Data Persistence: The application persists the user-indicated temperature along with the reported temperature received from the weather API. The data is stored in both a MongoDB collection and a Supabase Postgres database.

## Deployment
You can deploy the application by following these steps:

1. Build the project using `npm run build` or `yarn build`.
2. Deploy the built files to your desired hosting platform.
3. Set up the environment variables in your deployment environment based on the ones specified in the `.env` file.
4. Start the application in the production environment using `npm start` or `yarn start`.

## Testing
To run the tests for this project, follow the instructions below:

### Flutter Tests

Make sure you have Flutter and Dart installed on your machine.

Navigate to the project's `test` directory.

Run the following command to execute the `widget_test.dart` file:

```bash
flutter test
```

This will run the Flutter widget tests and provide the test results.

Jest Tests
Make sure you have Node.js installed on your machine.

Navigate to the project's pages/api/tests directory.

Run the following command to execute the Jest test file:

```bash
npm test
```