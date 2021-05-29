<?php

namespace Model;

use Model\ModelAbstract;
use Core\Db;
use Model\MapField;
use Model\UserResource;

class Faq extends ModelAbstract
{
    public const TABLE_NAME = 'faq';
    public const QUESTION_COLUMN = 'question';
    public const ANSWER_COLUMN = 'answer';

    public static function getAllQA()
    {
        $db = new DB;
        $result = $db->select()->from(self::TABLE_NAME)->get();
        return $result;
    }
}