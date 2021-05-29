<?php $QA = $this->data['qa']; ?>
<div class="DisplayBox">
    <ul>
        <?php foreach ($QA as $qa) { ?>
        <li>
            <strong><?php echo $qa["question"]; ?></strong>
            <br />
            <?php echo $qa["answer"]; ?>
        </li>
        <?php } ?>
    </ul>
</div>