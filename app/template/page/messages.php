<?php $Info = $this->data['info']; ?>

<?php if (isset($Info['message'])) { ?>
    <div class="success">
        <?php print_r($Info['message']); ?>
    </div>
<?php } ?>

<div class="DisplayBox">
    <div style="text-align: center;">
        <a href="<?php echo BASE_URL ?>/messages">Inbox (<?php echo count($Info['received']); ?>)</a>
        <a href="<?php echo BASE_URL ?>/messages/sent" style="margin: 0 25px 0 25px">Sent (<?php echo count($Info['sent']); ?>)</a>
        <a href="<?php echo BASE_URL ?>/messages/new">New Message</a>
    </div>
    
    <hr style="margin: 25px;"/>

    <?php if ($Info['method'] == 'list') { ?>
        <table style="width:50%; margin-left: auto; margin-right: auto; text-align:center">
            <tr style="border-bottom: 1px solid black;">
                <th style="text-align:center">From</th>
                <th style="text-align:center">Subject</th>
                <th style="text-align:center">Date</th>
            </tr>
          <?php foreach ($Info['received'] as $message) { ?>
           <?php if ($message['isread'] == 1) { ?>
            <tr>
                <td><?php echo $message["from"]; ?></td>
                <td><a href="<?php echo BASE_URL ?>/messages/?id=<?php echo $message['id']; ?>"><?php echo $message["subject"]; ?></a></td>
                <td><?php echo $message["senttime"]; ?></td>
            </tr>
            <?php } else { ?>
            <tr>
                <td><strong><?php echo $message["from"]; ?></strong></td>
                <td><strong><a href="<?php echo BASE_URL ?>/messages/?id=<?php echo $message['id']; ?>"><?php echo $message["subject"]; ?></a></strong></td>
                <td><strong><?php echo $message["senttime"]; ?></strong></td>
            </tr>
            <?php }} ?>
        </table>
    <?php } ?>

    <?php if ($Info['method'] == 'list_sent') { ?>
        <table style="width:50%; margin-left: auto; margin-right: auto; text-align: center">
            <tr style="border-bottom: 1px solid black;">
                <th style="text-align:center">To</th>
                <th style="text-align:center">Subject</th>
                <th style="text-align:center">Date</th>
            </tr>
          <?php foreach ($Info['sent'] as $message) { ?>
           <tr>
               <td><?php echo $message["to"]; ?></td>
               <td><a href="<?php echo BASE_URL ?>/messages/sent/?id=<?php echo $message['id']; ?>"><?php echo $message["subject"]; ?></a></td>
               <td><?php echo $message["senttime"]; ?></td>
           </tr>
           <?php } ?>
        </table>
    <?php } ?>

    <?php if ($Info['method'] == 'view_mail') { ?>
        <div style="text-align: center">
            <div style="display: inline-block; text-align: left">
                <strong><p>From:</strong> <?php echo $Info['mail']->getSenderName(); ?></p>
                <strong><p>Subject:</strong> <?php echo $Info['mail']->getSubject(); ?><strong style="margin-left: 100px;">Date:</strong> <?php echo $Info['mail']->getTime(); ?></p>
                <strong><p style="border-bottom: 1px solid black;">Message</p></strong>
                <p><?php echo $Info['mail']->getMessage(); ?></p>
            </div>
        </div>
    <?php } ?>

    <?php if ($Info['method'] == 'view_mail_sent') { ?>
        <div style="text-align: center">
            <div style="display: inline-block; text-align: left">
                <strong><p>To:</strong> <?php echo $Info['mail']->getReceiverName(); ?></p>
                <strong><p>Subject:</strong> <?php echo $Info['mail']->getSubject(); ?><strong style="margin-left: 100px;">Date:</strong> <?php echo $Info['mail']->getTime(); ?></p>
                <strong><p style="border-bottom: 1px solid black;">Message</p></strong>
                <p><?php echo $Info['mail']->getMessage(); ?></p>
            </div>
        </div>
    <?php } ?>

    <?php if ($Info['method'] == 'new_message') { ?>
        <div style="margin-left: auto; margin-right: auto; width: 250px;">
            <?php echo $Info['form']; ?>
        </div>
    <?php } ?>
</div>