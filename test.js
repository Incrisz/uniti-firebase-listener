exports.handler = async (event) => {
  const env = process.env.NODE_ENV;
  let events = [];

  if (env === "production") {
    for (const record of event.Records) {
      const decodedStr = Buffer.from(record.kinesis.data, "base64").toString("utf8");
      const payload = JSON.parse(decodedStr);

      // Log the raw payload for debugging
      console.log(JSON.stringify(payload));

      // Use the fields actually sent by your Python producer
      events.push({
        collection: payload.collection || [],
        timestamp: payload.timestamp,
      });
    }
  }

  // TODO: process `events` as needed
  return { statusCode: 200 };
};
