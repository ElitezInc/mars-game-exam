<?php

namespace Model;

use Core\Db;

class UserResource extends ModelAbstract
{
    public const TABLE_NAME = 'user_resource';
    public const USER_ID_COLUMN = 'user_id';
    public const RESOURCE_ID_COLUMN = 'resource_id';
    public const VALUE_COLUMN = 'value';
    /**
     * @var integer
     */
    private $resourceId;

    /**
     * @var integer
     */
    private $userId;

    /**
     * @var integer
     */
    private $value;

    /**
     * @return int
     */
    public function getResourceId(): int
    {
        return $this->resourceId;
    }

    /**
     * @param int $resourceId
     */
    public function setResourceId(int $resourceId): void
    {
        $this->resourceId = $resourceId;
    }

    /**
     * @return int
     */
    public function getUserId(): int
    {
        return $this->userId;
    }

    /**
     * @param int $userId
     */
    public function setUserId(int $userId): void
    {
        $this->userId = $userId;
    }

    /**
     * @return int
     */
    public function getValue(): int
    {
        return $this->value;
    }

    /**
     * @param int $value
     */
    public function setValue(int $value): void
    {
        $this->value = $value;
    }

    public function prepeareArray()
    {
        return [
          self::USER_ID_COLUMN => $this->userId,
          self::RESOURCE_ID_COLUMN => $this->resourceId,
          self::VALUE_COLUMN => $this->value
        ];
    }

    public function load($id){
        $db = new Db();
        $resourse  = $db->select()->from(self::TABLE_NAME)->where(self::ID_COLUMN, $id)->getOne();
        $this->id = $resourse[self::ID_COLUMN];
        $this->resourceId = $resourse[self::RESOURCE_ID_COLUMN];
        $this->userId = $resourse[self::USER_ID_COLUMN];
        $this->value = $resourse[self::VALUE_COLUMN];
        return $this;
    }

    public function loadUserResourses($userId)
    {
        $db = new Db();
        $resources = $db->select()->from(self::TABLE_NAME)->where(self::USER_ID_COLUMN, $userId)->get();
        return $resources;
    }


}