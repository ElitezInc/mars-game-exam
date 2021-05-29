<?php

namespace Controller;

use Core\Controller;
use Helper\FormBuilder;
use Helper\Url;
use Model\City;
use Model\MapField;
use Model\User as UserModel;
use Model\Message as MessagesModel;
use Core\Request;
use Helper\Validation\InputValidation as Validation;
use Service\Map\Field\AssignField;
use Service\Game\InitUserInGame;

class Messages extends Controller
{
    public function __construct()
    {
        parent::__construct();
        if(!$this->isLogedIn()){
            Url::redirect(Url::make('/user/login'));
        }
    }

    public function index()
    {
        $request = new Request();

        if ($request->getGet('message') != null)
        {
            $Info['message'] = $request->getGet('message');
        }
            
        $Info['received'] = MessagesModel::getAllMessagesReceived($this->userSession->getAuthUserId());
        
        foreach ($Info['received'] as &$Message) 
        {
            $From = new UserModel();
            $From->load($Message['fromid']);
            $Message['from'] = $From->getUserName();
        }

        if ($request->getGet('id') != null && array_search($request->getGet('id'), array_column($Info['received'], 'id')) !== false)
        {
            $message = new MessagesModel();
            $message->load($request->getGet('id'));
            $message->setRead(1);
            $message->save();

            $Info['mail'] = $message;
        }

        $Info['sent'] = MessagesModel::getAllMessagesSent($this->userSession->getAuthUserId());
        
        if (isset($Info['mail'])) $Info['method'] = 'view_mail';
        else $Info['method'] = 'list';

        $this->data['info'] = $Info;
        $this->render('page/messages', $this->data);
    }

    public function sent()
    {
        $request = new Request();
        $Info['sent'] = MessagesModel::getAllMessagesSent($this->userSession->getAuthUserId());
        
        foreach ($Info['sent'] as &$Message) 
        {
            $To = new UserModel();
            $To->load($Message['toid']);
            $Message['to'] = $To->getUserName();
        }

        if ($request->getGet('id') != null && array_search($request->getGet('id'), array_column($Info['sent'], 'id')) !== false)
        {
            $message = new MessagesModel();
            $message->load($request->getGet('id'));
            $Info['mail'] = $message;
        }
        
        $Info['received'] = MessagesModel::getAllMessagesReceived($this->userSession->getAuthUserId());
        
        if (isset($Info['mail'])) $Info['method'] = 'view_mail_sent';
        else $Info['method'] = 'list_sent';

        $this->data['info'] = $Info;
        $this->render('page/messages', $this->data);
    }

    public function new()
    {
        $form = new FormBuilder('post', Url::make('/messages/send'));
        $form->input('subject', 'text', '', 'Subject Title', 'subject', '', 'Subject')
        ->select('to', array_map(function ($value) { return $value['name']; }, UserModel::getAllUsers()), 'to', 'User')
        ->texarea('text', 'text', 'Message')
        ->input('send', 'submit', 'Send');

        $Info['received'] = MessagesModel::getAllMessagesReceived($this->userSession->getAuthUserId());
        $Info['sent'] = MessagesModel::getAllMessagesSent($this->userSession->getAuthUserId());
        $Info['form'] = $form->get();
        $Info['method'] = 'new_message';

        $this->data['info'] = $Info;
        $this->render('page/messages', $this->data);
    }

    public function send()
    {
        $request = new Request();

        $message = new MessagesModel();
        $message->setFromID($this->userSession->getAuthUserId());
        $message->setToID(UserModel::getAllUsers()[array_search($request->getPost('to'), array_column(UserModel::getAllUsers(), 'name'))]['id']);
        $message->setSubject($request->getPost('subject'));
        $message->setMessage($request->getPost('text'));
        $message->setRead(0);
        $message->setTime(date('Y-m-d H:i:s'));
        $message->save();

        Url::redirect(Url::make('/messages/?message=Message%20sent%20successfully.'));
    }
}