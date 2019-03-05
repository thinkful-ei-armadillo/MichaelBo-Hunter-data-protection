const express = require('express')
const CommentsService = require('./comments-service')

const commentsRouter = express.Router()

const { requireAuth } = require('../middleware/basic-auth.js')

commentsRouter
  .route('/')
  .get((req, res, next) => {
    CommentsService.getAllComments(req.app.get('db'))
      .then(comments => {
        res.json(CommentsService.serializeComments(comments))
      })
      .catch(next)
  })

commentsRouter
  .route('/:comment_id')
  .all(requireAuth)
  .all(checkCommentExists)
  .get((req, res) => {
    res.json(CommentsService.serializeComment(res.comment))
  })

commentsRouter.route('/:comment_id/reviews/')
  .all(requireAuth)
  .all(checkCommentExists)
  .get((req, res, next) => {
    CommentsService.getReviewsForComment(
      req.app.get('db'),
      req.params.comment_id
    )
      .then(reviews => {
        res.json(CommentsService.serializeCommentReviews(reviews))
      })
      .catch(next)
  })

/* async/await syntax for promises */
async function checkCommentExists(req, res, next) {
  try {
    const comment = await CommentsService.getById(
      req.app.get('db'),
      req.params.comment_id
    )

    if (!comment)
      return res.status(404).json({
        error: `Comment doesn't exist`
      })

    res.comment = comment
    next()
  } catch (error) {
    next(error)
  }
}

module.exports = commentsRouter