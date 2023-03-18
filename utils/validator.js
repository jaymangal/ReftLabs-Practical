module.exports = {
  validateFields: (requestBody) => {
    const errorMessage = [];
    for (const key in requestBody) {
      if (!requestBody[key] || String(requestBody[key]).trim() == "") {
        const field_name = `${key.split("_")[0]}${
          key.split("_")[1] ? " " + key.split("_")[1] : ""
        }`;
        errorMessage.push(`The ${field_name} field is required`);
      }
    }
    return errorMessage;
  },
};
