<?php 
    //2c393b1ce62207e32ba629a954837494
    
    $query = http_build_query([
        'access_key' => '2c393b1ce62207e32ba629a954837494',
        'ua' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36',
      ]);
      
      $ch = curl_init('http://api.userstack.com/detect?' . $query);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      
      $json = curl_exec($ch);
      curl_close($ch);
      echo $json;
?>
