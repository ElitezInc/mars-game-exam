<?php

namespace Model;

use Model\ModelAbstract;
use Core\Db;
use Model\MapField;
use Model\User as UserModel;

class Message extends ModelAbstract
{
    public const TABLE_NAME = 'messages';
    public const FROM_COLUMN = 'fromid';
    public const TO_COLUMN = 'toid';
    public const SUBJECT_COLUMN = 'subject';
    public const MESSAGE_COLUMN = 'message';
    public const READ_COLUMN = 'isread';
    public const TIME_COLUMN = 'senttime';

    private $FromID;
    private $ToID;
    private $Subject;
    private $Message;
    private $Read;
    private $Time;

    public function setFromID($id)
    {
        $this->FromID = $id;
    }

    public function setToID($id)
    {
        $this->ToID = $id;
    }

    public function setSubject($Subject)
    {
        $this->Subject = $Subject;
    }

    public function setMessage($Message)
    {
        $this->Message = $Message;
    }

    public function setRead($Read)
    {
        $this->Read = $Read;
    }

    public function setTime($Time)
    {
        $this->Time = $Time;
    }

    public function getSenderName()
    {
        $From = new UserModel();
        $From->load($this->FromID);

        return $From->getUserName();
    }

    public function getReceiverName()
    {
        $To = new UserModel();
        $To->load($this->ToID);

        return $To->getUserName();
    }

    public function getSubject()
    {
        return $this->Subject;
    }

    public function getMessage()
    {
        return $this->Message;
    }

    public function getTime()
    {
        return $this->Time;
    }

    public function load($id)
    {
        $db = new Db();
        $message = $db->select()->from(self::TABLE_NAME)->where(self::ID_COLUMN, $id)->getOne();

        $this->id = $message[self::ID_COLUMN];
        $this->FromID = $message[self::FROM_COLUMN];
        $this->ToID = $message[self::TO_COLUMN];
        $this->Subject = $message[self::SUBJECT_COLUMN];
        $this->Message = $message[self::MESSAGE_COLUMN];
        $this->Read = $message[self::READ_COLUMN];
        $this->Time = $message[self::TIME_COLUMN];

        return $this;
    }

    public function prepeareArray()
    {
        return [
            self::FROM_COLUMN => $this->FromID,
            self::TO_COLUMN => $this->ToID,
            self::SUBJECT_COLUMN => $this->Subject,
            self::MESSAGE_COLUMN => $this->Message,
            self::READ_COLUMN => $this->Read,
            self::TIME_COLUMN => $this->Time
        ];
    }

    public static function getAllMessagesSent($userId)
    {
        $db = new DB;
        $result = $db->select()->from(self::TABLE_NAME)->where(self::FROM_COLUMN, $userId)->get();
        return $result;
    }

    public static function getAllMessagesReceived($userId)
    {
        $db = new DB;
        $result = $db->select()->from(self::TABLE_NAME)->where(self::TO_COLUMN, $userId)->get();
        return $result;
    }
}