const validator = require("../utils/validator");
const { sendResponse, sendResponseWithData } = require("../utils/sendResponse");
const db = require("../database/connection");
const Resources = db.resources;
const moment = require("moment");
const { getCacheValue, setCacheValue } = require("../cache/redis");

module.exports = {
  addResources: async (req, res) => {
    try {
      const { name, price } = req.body;
      const errorMessages = validator.validateFields({
        name,
        price,
      });

      if (errorMessages.length) {
        return sendResponse(errorMessages, "failed", 422, res);
      }

      const insertResources = await Resources.create({
        name,
        price,
        createdAt: moment().toISOString(),
        updatedAt: moment().toISOString(),
      });

      if (!!insertResources) {
        return sendResponse(
          "Resources inserted succefully.",
          "failed",
          200,
          res
        );
      } else {
        throw new Error("Something went wrong!.");
      }
    } catch (err) {
      return sendResponse(err.message, "failed", 400, res);
    }
  },

  getAllResources: async (req, res) => {
    try {
      const { page, per_page, field, order_by } = req.query;
      const lastInsertedRecord = await Resources.findOne({
        attributes: ["updatedAt"],
        raw: true,
        order: [["id", "DESC"]],
      });

      const ifCache = await getCacheValue(
        `resource-list-${lastInsertedRecord.updatedAt}${
          page && per_page ? `-${page}-${per_page}` : ""
        }${field && order_by ? `-${field}-${order_by}` : ""}`
      );
      if (ifCache) {
        return sendResponseWithData(
          "success",
          "success",
          200,
          { Resources: ifCache, count: ifCache.length },
          res
        );
      }

      const queryObj = {};
      if (page && per_page) {
        Object.assign(queryObj, {
          limit: per_page,
          offset: (page - 1) * per_page,
        });
      }

      if (field && order_by) {
        Object.assign(queryObj, {
          order: [[field, order_by]],
        });
      }

      const allResources = await Resources.findAll({
        order: [["id", "DESC"]],
        raw: true,
        ...queryObj,
      });

      if (!!allResources) {
        await setCacheValue(
          `resource-list-${lastInsertedRecord.updatedAt}${
            page && per_page ? `-${page}-${per_page}` : ""
          }${field && order_by ? `-${field}-${order_by}` : ""}`,
          allResources
        );
        return sendResponseWithData(
          "success",
          "success",
          200,
          { Resources: allResources, count: allResources.length },
          res
        );
      } else {
        throw new Error("Something went wrong!");
      }
    } catch (err) {
      return sendResponse(err.message, "failed", 400, res);
    }
  },

  updateResources: async (req, res) => {
    try {
      const { id, name, price } = req.body;
      const errorMessages = validator.validateFields({
        id,
        name,
        price,
      });

      if (errorMessages.length) {
        return sendResponse(errorMessages, "failed", 422, res);
      }

      const getResources = await Resources.findOne({
        where: { id: id },
      });

      if (!getResources) {
        throw new Error("Resources not found with provided Resources id.");
      }

      const updateResources = await Resources.update(
        {
          name,
          price,
          updatedAt: moment().toISOString(),
        },
        {
          where: { id: id },
        }
      );
      if (!!updateResources) {
        return sendResponse(
          "Resources updated succefully.",
          "failed",
          200,
          res
        );
      } else {
        throw new Error("Something went wrong!");
      }
    } catch (err) {
      return sendResponse(err.message, "failed", 400, res);
    }
  },

  deleteResources: async (req, res) => {
    try {
      const { id } = req.query;
      const errorMessages = validator.validateFields({ id });
      if (errorMessages.length) {
        return sendResponse(errorMessages, "failed", 422, res);
      }

      const getResources = await Resources.findOne({
        where: { id: id },
      });
      if (!getResources) {
        throw new Error("Resources not found with provided Resources id.");
      }

      const deleteResources = await Resources.destroy({
        where: { id: id },
      });
      if (!!deleteResources) {
        return sendResponse(
          "Resources deleted succefully.",
          "failed",
          200,
          res
        );
      } else {
        throw new Error("Something went wrong!");
      }
    } catch (err) {
      return sendResponse(err.message, "failed", 400, res);
    }
  },
};
