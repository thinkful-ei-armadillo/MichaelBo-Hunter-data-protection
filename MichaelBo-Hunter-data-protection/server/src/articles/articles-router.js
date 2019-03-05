'use strict'; 

const express = require('express');
const path = require('path');
const ArticlesService = require('./articles-service');
const { requireAuth } = require('../middleware/basic-auth'); 

const articlesRouter = express.Router();
const jsonBodyParser = express.json();


articlesRouter
  .route('/')
  .post(requireAuth, jsonBodyParser, (req, res, next) => {
    const { thing_id, rating, text } = req.body;
    const newArticle = { thing_id, rating, text };

    for (const [key, value] of Object.entries(newArticle))
      if (value == null)
        return res.status(400).json({
          error: `Missing '${key}' in request body`
        });

    newArticle.user_id = req.user.id; 

    ArticlesService.insertArticle(
      req.app.get('db'),
      newArticle
    )
      .then(article => {
        res
          .status(201)
          .location(path.posix.join(req.originalUrl, `/${article.id}`))
          .json(ArticlesService.serializeArticle(article));
      })
      .catch(next);
  });

module.exports = articlesRouter;