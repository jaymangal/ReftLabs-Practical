const Redis = require("ioredis");
const redis = new Redis();

const setCacheValue = async (key, value) => {
  return new Promise((resolve, reject) => {
    try {
      redis.set(key, JSON.stringify(value));
      resolve(true);
    } catch (err) {
      reject(err);
    }
  });
};

const getCacheValue = async (key) => {
  return new Promise((resolve, reject) => {
    redis.get(key, (err, result) => {
      if (err) {
        reject(err);
      } else {
        resolve(JSON.parse(result));
      }
    });
  });
};

module.exports = { setCacheValue, getCacheValue };
