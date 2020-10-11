import express from 'express';
import {modifyMessage} from '../middleware';
import {indexPage} from '../controllers/index';
import {messagesPage, addMessage} from '../controllers/messages';

const indexRouter = express.Router();

indexRouter.get('/', indexPage);
indexRouter.get('/messages', messagesPage);
indexRouter.post('/messages', modifyMessage, addMessage);

export default indexRouter;
