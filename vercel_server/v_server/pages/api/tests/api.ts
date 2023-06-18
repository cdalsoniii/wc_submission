import { NextApiRequest, NextApiResponse } from 'next';
import axios from 'axios';
import { MongoClient } from 'mongodb';
import { createClient } from '@supabase/supabase-js';
import { writeMongo, writeOpinion } from '../weather_processing'


describe('API Tests', () => {
  it('should write to MongoDB', async () => {
    const zipcode = 12345;
    const opinion = 'good';

    // Mock MongoDB connection and collection
    const insertOneMock = jest.fn().mockResolvedValue({ insertedId: 'mockId' });
    const collectionMock = jest.fn().mockReturnValue({ insertOne: insertOneMock });
    const dbMock = jest.fn().mockReturnValue({ collection: collectionMock });
    const connectMock = jest.fn();
    const closeMock = jest.fn();

    jest.mock('mongodb', () => ({
      MongoClient: jest.fn().mockImplementation(() => ({
        connect: connectMock,
        db: dbMock,
        close: closeMock,
      })),
    }));

    // Call the function
    await writeMongo(zipcode, opinion);

    // Assertions
    expect(connectMock).toHaveBeenCalledTimes(1);
    expect(connectMock).toHaveBeenCalledWith(process.env.MONGO_URI, {
      serverApi: {
        version: expect.any(String),
        strict: expect.any(Boolean),
        deprecationErrors: expect.any(Boolean),
      },
    });
    expect(dbMock).toHaveBeenCalledTimes(1);
    expect(dbMock).toHaveBeenCalledWith('test');
    expect(collectionMock).toHaveBeenCalledTimes(1);
    expect(collectionMock).toHaveBeenCalledWith('weathers');
    expect(insertOneMock).toHaveBeenCalledTimes(1);
    expect(insertOneMock).toHaveBeenCalledWith({ zipcode, opinion });
    expect(closeMock).toHaveBeenCalledTimes(1);
  });

  it('should write to Supabase', async () => {
    const zipcode = 12345;
    const opinion = 'good';

    // Mock Supabase insert method
    const insertMock = jest.fn().mockResolvedValue({ data: [], error: null });
    const fromMock = jest.fn().mockReturnValue({ insert: insertMock });

    jest.mock('@supabase/supabase-js', () => ({
      createClient: jest.fn().mockImplementation(() => ({
        from: fromMock,
      })),
    }));

    // Call the function
    await writeOpinion(zipcode, opinion);

    // Assertions
    expect(fromMock).toHaveBeenCalledTimes(1);
    expect(fromMock).toHaveBeenCalledWith('weatherData');
    expect(insertMock).toHaveBeenCalledTimes(1);
    expect(insertMock).toHaveBeenCalledWith([{ zipcode, opinion }]);
  });

  // Add more tests for other functions

  // Note: The getForecast function may require additional setup to mock the fetch method and the returned data.
});