<?php
// Using json-data saved in text file


// path and name of the file
$filetxt = 'posts.txt';

// check if the file exists
if(file_exists($filetxt)) {
  // gets json-data from file
  $jsondata = file_get_contents($filetxt);

  // converts json string into array
  $arr_data = json_decode($jsondata, true);

  // Now you can use the array $arr_data with json-data saved in text file
  var_export($arr_data);        // Test to see the array
}
else echo 'The file '. $filetxt .' not exists';
?>