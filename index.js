const { eventToSignal } = require("./signal");
const { signalToMilestone } = require("./milestone");
const dotenv = require("dotenv");
dotenv.config();

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
  } else {
    events = [
      {
        androidVersion: "15",
        date: "2025-09-12",
        deviceModel: "samsung SM-S928B",
        eventType: "AGGREGATE",
        isScheduled: true,
        lastTimeUsed: 0,
        lastTimeUsedFormatted: "1970-01-01 00:00:00",
        packageName: "inc.loop.ppt",
        phoneNumber: "",
        rank: 0,
        sessionId: "a2556448-8992-48c1-bb6f-49f133f62f8c",
        totalTimeInForeground: 0,
        totalTimeInForegroundMinutes: 0,
        totalTimeInForegroundMs: 300000,
        userId: "03dc138a-04da-4a0c-bd19-e9efbf238407",
        username: "",
      },
    ];
  }
  for (const event of events) {
    try {
      const signals = await eventToSignal(event);
      await signalToMilestone(event, signals);
    } catch (err) {
      console.error("Error processing event:", err);
      return {
        statusCode: 500,
        body: JSON.stringify({ error: err.message }),
      };
    }
  }
};
