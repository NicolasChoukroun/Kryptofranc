<?php
$path_to_file = "d:/projects 2/KryptoFranc/dash/src/qt/locale";
if (!file_exists($path_to_file."/dash_en.ts")) die("Wrong Path: you need to edit the path of your project in the PHP file");
$cdir=find_all_files($path_to_file);
$name="KryptoFranc";
$nbrtotal=0;
foreach ($cdir as $key => $value) 
{ 
	$nbr=0;
	if (!in_array($value,array(".",".."))) 
	{ 
		if (!is_dir($dir . DIRECTORY_SEPARATOR . $value) && strpos($value,".php")===false && strpos($value,".bat")===false && strpos($value,".tmp")===false) 
		{ 
			$result = $value; 
			echo "Translating ".$result."...\r\n";

			// replace bitcoin
			$reading = fopen($result, 'r');
			$writing = fopen($result.'.tmp', 'w');
		
			$replaced = false;

			while (!feof($reading)) {
				$line = fgets($reading);
	
				//if (strpos($line,"<translation>")>0 && $line<>false){
				if ($line<>false){					
					$line=str_replace("dash", strtolower($name),$line);
					//$line=str_replace("bitCoin", $name,$line);
					//$line=str_replace("BitCoin", ucwords($name),$line);
					$line=str_replace("Dash", lcfirst($name),$line);
					$line=str_replace("DASH", strtoupper($name),$line);							
					$replaced=true;
					$nbr++;$nbrtotal++;
					echo "line=".$line."Nbr: ".$nbr." - Total: ".$nbrtotal."\r\n";
				
				}
				fputs($writing, $line);
			}
			fclose($reading); fclose($writing);			
			// might as well not overwrite the file if we didn't replace anything
			if ($replaced) 
			{
				unlink($result);
				rename($result.'.tmp', $result);
				unlink($result.'.tmp');
			} else {
				unlink($result.'.tmp');
			}
			//echo "Nbr of modifications: ".$nbr." - Total: ".$nbrtotal." ->";
		} 
	} 
} 
echo "\r\nOperation Finished\r\n";
echo "Total modifications: ".$nbrtotal;
function find_all_files($dir) 
{ 
    $root = scandir($dir); 
    foreach($root as $value) 
    { 
        if($value === '.' || $value === '..') {continue;} 
        if(is_file("$dir/$value")) {$result[]="$dir/$value";continue;} 
        foreach(find_all_files("$dir/$value") as $value) 
        { 
            $result[]=$value; 
        } 
    } 
    return $result; 
} 
?>
