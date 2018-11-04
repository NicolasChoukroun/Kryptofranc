<?php
$path_to_file = "d:/projects 2/KryptoFranc/kryptofranccore";
if (!file_exists($path_to_file."/configure.ac")) die("Wrong Path: you need to edit the path of your project in the PHP file");
//$cdir = array_slice(scandir($path_to_file), 2);
$cdir=find_all_files($path_to_file);
$name="KryptoFranc";
$nbrtotal=0; $nbrfiles=0;
// first replace some important variables
replace_in_file($path_to_file."/src/qt/intro.cpp","storageRequiresMsg.arg(requiredSpace) + \" \" +","");
replace_in_file($path_to_file."/src/qt/intro.cpp","BLOCK_CHAIN_SIZE = 220","BLOCK_CHAIN_SIZE = 1");
replace_in_file($path_to_file."/src/qt/intro.cpp",".arg(2009)",".arg(2019)");
replace_in_file($path_to_file."/src/qt/bitcoinstrings.cpp","(\"bitcoin-core\", \"Bitcoin Core\")","(\"bitcoin-core\", \"KryptoFranc Core\")");

// change the blockchain parameters
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xf9;","= 0x4b;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xbe;","= 0x59;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xb4;","= 0x46;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xd9;","= 0x20;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 8333;","= 1789;");
replace_in_file($path_to_file."/src/chainparams.cpp","18333;","11789;");
replace_in_file($path_to_file."/src/chainparams.cpp","CreateGenesisBlock(1231006505, 2083236893, 0x1d00ffff, 1, 50 * COIN);","CreateGenesisBlock(1546300800, 2083236893, 0x1d00ffff, 1, 1 * COIN);");
replace_in_file($path_to_file."/src/chainparams.cpp","The Times 03/Jan/2009 Chancellor on brink of second bailout for banks","CNBC 2018/07/24 Singapore Officially Backs a CryptoCurrency and Establishes it as their Official Coin");
replace_in_file($path_to_file."/src/chainparams.cpp","assert(consensus.hashGenesisBlock","//assert(consensus.hashGenesisBlock");
replace_in_file($path_to_file."/src/chainparams.cpp","assert(genesis.hashMerkleRoot","//assert(genesis.hashMerkleRoot");
replace_in_file($path_to_file."/src/chainparams.cpp","seed.bitcoin.sipa.be","seed1.kryptofranc.net");
replace_in_file($path_to_file."/src/chainparams.cpp","dnsseed.bluematt.me","seed2.kryptofranc.net");
replace_in_file($path_to_file."/src/chainparams.cpp","dnsseed.bitcoin.dashjr.org","seed3.kryptofranc.net");
replace_in_file($path_to_file."/src/chainparams.cpp","vSeeds.emplace_back(/"seed.bitcoinstats","//vSeeds.emplace_back(/"seed.bitcoinstats");
replace_in_file($path_to_file."/src/chainparams.cpp","vSeeds.emplace_back(/"seed.bitcoin.jonasschnelli.ch","//vSeeds.emplace_back(/"seed.bitcoin.jonasschnelli.ch");
replace_in_file($path_to_file."/src/chainparams.cpp","vSeeds.emplace_back(/"seed.btc.petertodd.org","//vSeeds.emplace_back(/"seed.btc.petertodd.org");
replace_in_file($path_to_file."/src/chainparams.cpp","vSeeds.emplace_back(/"seed.bitcoin.sprovoost.nl","//vSeeds.emplace_back(/"seed.bitcoin.sprovoost.nl");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 11111,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 33333,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 74000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 105000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 134444,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 168000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 193000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 210000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 216116,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 225430,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 250000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 279000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 295000,","//{ 11111,");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP34Height = 227931","BIP34Height = 0 // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP65Height = 388381","BIP65Height = 0 // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP66Height = 363725","BIP65Height = 0 // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","0x0000000000000000000000000000000000000000028822fef1c230963535a90d","0000000000000000000000000000000000000000000000000000000100010001"); 
replace_in_file($path_to_file."/src/chainparams.cpp","nPowTargetSpacing = 10 * 60","nPowTargetSpacing = 10 * 60"); // change block time (10 min)
replace_in_file($path_to_file."/src/chainparams.cpp","nPowTargetTimespan = 14 * 24 * 60 * 60;","nPowTargetTimespan = 14 * 24 * 60 * 60;"); // Change the difficulty adjustment interval (2 weeks)

replace_in_file($path_to_file."/src/chainparamsbase.cpp","8332","1790"); // change RPC port value

replace_in_file($path_to_file."/amount.h","21000000","1000000000"); // change the max money that can  be spend in 1 transaction 

replace_in_file($path_to_file."/src/consensus/consensus.h","COINBASE_MATURITY = 100","COINBASE_MATURITY = 1"); // change the number of confirmations to a low number for starting - change to a higher value later

// validation host the rewards 
replace_in_file($path_to_file."/src/validation.cpp","(1 << 10) * COIN","(1 << 10) * COIN");
replace_in_file($path_to_file."/src/validation.cpp","CAmount nSubsidy = 50 * COIN;","CAmount nSubsidy = 28028 * COIN; int years = (int) nHeight/52560; double half = (years/1.618033988750);");
replace_in_file($path_to_file."/src/validation.cpp","nSubsidy >>= halvings;","nSubsidy =   nSubsidy / half;");
replace_in_file($path_to_file."/src/validation.cpp","(1 << 10) * COIN","(1 << 10) * COIN");
replace_in_file($path_to_file."/src/validation.cpp","(1 << 10) * COIN","(1 << 10) * COIN");
replace_in_file($path_to_file."/src/validation.cpp","(1 << 10) * COIN","(1 << 10) * COIN");


// change the names of the executables as well as the Bitcoin Core weird strings.
replace_in_file($path_to_file."/configure.ac","[Bitcoin Core]","[Kryptofranc Core]");
replace_in_file($path_to_file."/configure.ac","bitcoind","kyfd");
replace_in_file($path_to_file."/configure.ac","bitcoin-qt","kyf-qt");
replace_in_file($path_to_file."/configure.ac","bitcoin-cli","kyf-cli");
replace_in_file($path_to_file."/configure.ac","bitcoin-tx","kyf-tx");
replace_in_file($path_to_file."/configure.ac","nSubsidyHalvingInterval = 210000;)","nSubsidyHalvingInterval = 52500;");
replace_in_file($path_to_file."/configure.ac","nSubsidyHalvingInterval = 210000;)","nSubsidyHalvingInterval = 52500;");replace_in_file($path_to_file."/configure.ac","nSubsidyHalvingInterval = 210000;)","nSubsidyHalvingInterval = 52500;");

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
	
				if ( strpos($line,"_INIT_RESOURCE")===false && stripos($line,"</header>")===false && stripos($line,"translate")===false && stripos($line,"include")===false && (stripos($line,"bitcoin")!==false || strpos($line,"BTC")!==false) && strpos($line,"")===false && $line<>false){
					
					//if (stripos($line,"TRANSLATE_NOOP")!==false && stripos($line,"Bitcoin Core")!==false) {
					//	$line=str_replace("Bitcoin Core", "KryptoFranc",$line);
					//	
					//}else{
							
						$line=str_replace("The Bitcoin Core developers", "xxxxxx",$line);
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
