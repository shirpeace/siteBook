<?php
$user=$_POST['user'];
$post=$_POST['posttext'];
$file = file_get_contents('posts.txt');
$data = json_decode($file);
unset($file);//prevent memory leaks for large json.
//insert data here
$data[] = array('user'=>$user , 'post'=>$post);
//save the file
file_put_contents('posts.txt',json_encode($data));
unset($data);//release memory
?>