<?php
$path_to_file = "d:/projects 2/KryptoFranc/kryptofranccore/src";
if (!file_exists($path_to_file."/addrdb.cpp")) die("Wrong Path: you need to edit the path of your project in the PHP file");
//$cdir = array_slice(scandir($path_to_file), 2);
$cdir=find_all_files($path_to_file);
$name="KryptoFranc";
$nbrtotal=0; $nbrfiles=0;
// first replace some important variables
replace_in_file($path_to_file."/qt/intro.cpp","storageRequiresMsg.arg(requiredSpace) + \" \" +","");
replace_in_file($path_to_file."/qt/intro.cpp","BLOCK_CHAIN_SIZE = 220","BLOCK_CHAIN_SIZE = 1");
replace_in_file($path_to_file."/qt/intro.cpp",".arg(2009)",".arg(2019)");
replace_in_file($path_to_file."/qt/bitcoinstrings.cpp","(\"bitcoin-core\", \"Bitcoin Core\")","(\"bitcoin-core\", \"KryptoFranc Core\")");

foreach ($cdir as $key => $value) 
{ 
	$nbr=0;$nbrfiles++;
	if (!in_array($value,array(".",".."))) 
	{ 
		if (!is_dir($dir . DIRECTORY_SEPARATOR . $value) && strpos($value,".tmp")===false && (strpos($value,".ui")!==false || strpos($value,".h")!==false || strpos($value,".cpp")!==false)) 
		{ 
			$result = $value; 
			echo "Renaming ".$result."...\r\n";

		
			$reading = fopen($result, 'r');
			$writing = fopen($result.'.tmp', 'w');
		
			$replaced = false;

			while (!feof($reading)) {
				$line = fgets($reading);
	
				if ( strpos($line,"_INIT_RESOURCE")===false && stripos($line,"</header>")===false && stripos($line,"translate")===false && stripos($line,"include")===false && strpos($line,"Copyright")===false && (stripos($line,"bitcoin")!==false || strpos($line,"BTC")!==false) && strpos($line,"")===false && $line<>false){
					
					//if (stripos($line,"TRANSLATE_NOOP")!==false && stripos($line,"Bitcoin Core")!==false) {
					//	$line=str_replace("Bitcoin Core", "KryptoFranc",$line);
					//	
					//}else{
						$line=str_replace("bitcoin-core", strtolower($name)."-core",$line);
						$line=str_replace("Bitcoin Core", ucwords($name),$line);
						$line=str_replace("bitcoin", strtolower($name),$line);
						$line=str_replace("bitCoin", $name,$line);
						$line=str_replace("BitCoin", ucwords($name),$line);
						$line=str_replace("Bitcoin", lcfirst($name),$line);
						$line=str_replace("BITCOIN", strtoupper($name),$line);	
						$line=str_replace("BTC", "KYF",$line);						
					//}
					$replaced=true;
					$nbr++;$nbrtotal++;
					//echo "line=".$line." Nbr: ".$nbr." - Total: ".$nbrtotal."\r\n";
				
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
			//echo "-> Nbr of modifications: ".$nbr." - Total: ".$nbrtotal."\r\n";
		} 
	} 
} 
echo "\r\nOperation Finished\r\n";
echo "Total modifications: ".$nbrtotal." - Nbr files scanned: ".$nbrfiles;


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

/**
 * Replaces a string in a file
 *
 * @param string $FilePath
 * @param string $OldText text to be replaced
 * @param string $NewText new text
 * @return array $Result status (success | error) & message (file exist, file permissions)
 */
function replace_in_file($FilePath, $OldText, $NewText)
{
    $Result = array('status' => 'error', 'message' => '');
    if(file_exists($FilePath)===TRUE)
    {
        if(is_writeable($FilePath))
        {
            try
            {
                $FileContent = file_get_contents($FilePath);
                $FileContent = str_replace($OldText, $NewText, $FileContent);
                if(file_put_contents($FilePath, $FileContent) > 0)
                {
                    $Result["status"] = 'success';
                }
                else
                {
                   $Result["message"] = 'Error while writing file';
                }
            }
            catch(Exception $e)
            {
                $Result["message"] = 'Error : '.$e;
            }
        }
        else
        {
            $Result["message"] = 'File '.$FilePath.' is not writable !';
        }
    }
    else
    {
        $Result["message"] = 'File '.$FilePath.' does not exist !';
    }
    return $Result;
}

?>
