exports.handler = async (event) => {
  const results = [];

  for (const record of event.Records) {
    const rawB64 = record.kinesis.data;

    // Decode Base64 → string
    const decodedStr = Buffer.from(rawB64, "base64").toString("utf8");

    // Parse JSON
    const decodedJson = JSON.parse(decodedStr);

    // Print only the JSON
    console.log(JSON.stringify(decodedJson));

    results.push(decodedJson);
  }

  return results;
};
