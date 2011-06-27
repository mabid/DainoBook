{
	"result":true,
	"tag": {
		"id":<?php echo $_REQUEST['name_id'] ?>,
		"text": "<?php echo $_REQUEST['name'] ?>",
		"left": <?php echo $_REQUEST['left'] ?>,
		"top": <?php echo $_REQUEST['top'] ?>,
		"width": <?php echo $_REQUEST['width'] ?>,
		"height": <?php echo $_REQUEST['height'] ?>,
		"url": "person.php?id=<?php echo $_REQUEST['name_id'] ?>",
		"isDeleteEnable": true
	}
}