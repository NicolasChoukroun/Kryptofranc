<?php


$path_to_file = "d:/projects 2/bitcoin-0.17.0.1";
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
replace_in_file($path_to_file."/src/qt/intro.cpp",".arg(2009)",".arg(2019)");

// change the blockchain parameters
replace_in_file($path_to_file."/src/chainparams.cpp",'bech32_hrp = "bc";','bech32_hrp = "kf";');
replace_in_file($path_to_file."/src/chainparams.cpp","fMineBlocksOnDemand = false;","fMineBlocksOnDemand = true;");
replace_in_file($path_to_file."/src/chainparams.cpp","nSubsidyHalvingInterval = 210000;","nSubsidyHalvingInterval = 210000/4; // every year");
replace_in_file($path_to_file."/src/chainparams.cpp","std::vector<unsigned char>(1,0)","std::vector<unsigned char>(1,75)"); // KYF keys starting with K
replace_in_file($path_to_file."/src/chainparams.cpp","std::vector<unsigned char>(1,5)","std::vector<unsigned char>(1,107)"); // with k
replace_in_file($path_to_file."/src/chainparams.cpp","std::vector<unsigned char>(1,128)","std::vector<unsigned char>(1,198)"); // with ╛ supposed to be yuan

replace_in_file($path_to_file."/src/chainparams.cpp","/* nTime    */ 1532884444,","/* nTime    */ 1543507133,");
replace_in_file($path_to_file."/src/chainparams.cpp","/* nTxCount */ 331282217,","/* nTxCount */ 0,");
replace_in_file($path_to_file."/src/chainparams.cpp","/* dTxRate  */ 2.4,","/* dTxRate  */ 0");
replace_in_file($path_to_file."/src/chainparams.cpp","1532884444","1543507133");
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xf9;","= 0x4b;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xbe;","= 0x59;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xb4;","= 0x46;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 0xd9;","= 0x20;");
replace_in_file($path_to_file."/src/chainparams.cpp","= 8333;","= 1789;");
replace_in_file($path_to_file."/src/chainparams.cpp","18333;","11789;");
replace_in_file($path_to_file."/src/chainparams.cpp","18444;","21789;");
replace_in_file($path_to_file."/src/chainparams.cpp","CreateGenesisBlock(1231006505, 2083236893, 0x1d00ffff, 1, 50 * COIN);","CreateGenesisBlock(1543507133, 1084870916, 486604799, 1, 51*COIN);");  // genesis params
replace_in_file($path_to_file."/src/chainparams.cpp","The Times 03/Jan/2009 Chancellor on brink of second bailout for banks","2018/07/24 Singapore Backs a CryptoCurrency and Establishes it as their Official Coin");
//replace_in_file($path_to_file."/src/chainparams.cpp","assert(consensus.hashGenesisBlock","//assert(consensus.hashGenesisBlock");
//replace_in_file($path_to_file."/src/chainparams.cpp","assert(genesis.hashMerkleRoot","//assert(genesis.hashMerkleRoot");

replace_in_file($path_to_file."/src/chainparams.cpp",'assert(consensus.hashGenesisBlock == uint256S("0x000000000933ea01ad0ee984209779baaec3ced90fa3f408719526f8d77f4943"));',"// removed");
replace_in_file($path_to_file."/src/chainparams.cpp",'assert(genesis.hashMerkleRoot == uint256S("0x677ab5e51b43e828c2c227350c25258a9a74f43861759be6df1d4781a6c252cd"));',"// removed");
replace_in_file($path_to_file."/src/chainparams.cpp",'assert(consensus.hashGenesisBlock == uint256S("0x0f9188f13cb7b2c71f2a335e3a4fc328bf5beb436012afca590b1a11466e2206"));',"// removed");
replace_in_file($path_to_file."/src/chainparams.cpp",'assert(genesis.hashMerkleRoot == uint256S("0x677ab5e51b43e828c2c227350c25258a9a74f43861759be6df1d4781a6c252cd"));',"// removed");
replace_in_file($path_to_file."/src/chainparams.cpp",'assert(consensus.hashGenesisBlock == uint256S("0x0000000080f4f927283ede64c9f58eb8cc381cd0292e3e339862f2aef8f91465"));',"// removed");


replace_in_file($path_to_file."/src/chainparams.cpp","seed.bitcoin.sipa.be","seed1.kryptofranc.net");
replace_in_file($path_to_file."/src/chainparams.cpp","dnsseed.bluematt.me","seed2.kryptofranc.net");
replace_in_file($path_to_file."/src/chainparams.cpp","dnsseed.bitcoin.dashjr.org","seed3.kryptofranc.net");
replace_in_file($path_to_file."/src/chainparams.cpp","// Pieter Wuille, only supports x1, x5, x9, and xd","// Kryptofranc network 1GB/s");
replace_in_file($path_to_file."/src/chainparams.cpp","// Matt Corallo, only supports x9","");
replace_in_file($path_to_file."/src/chainparams.cpp","// Luke Dashjr","");
replace_in_file($path_to_file."/src/chainparams.cpp",'vSeeds.emplace_back("seed.bitcoinstats','//vSeeds.emplace_back("seed.bitcoinstats');
replace_in_file($path_to_file."/src/chainparams.cpp",'vSeeds.emplace_back("seed.bitcoin.jonasschnelli.ch','//vSeeds.emplace_back("seed.bitcoin.jonasschnelli.ch');
replace_in_file($path_to_file."/src/chainparams.cpp",'vSeeds.emplace_back("seed.btc.petertodd.org','//vSeeds.emplace_back("seed.btc.petertodd.org');
replace_in_file($path_to_file."/src/chainparams.cpp",'vSeeds.emplace_back("seed.bitcoin.sprovoost.nl','//vSeeds.emplace_back("seed.bitcoin.sprovoost.nl');

// checkpoint

replace_in_file($path_to_file."/src/chainparams.cpp",'{ 11111, uint256S("0x0000000069e244f73d78e8fd29ba2fd2ed618bd6fa2ee92559f542fdb26e7c1d")}','{ 0, uint256S("0x26cb14ab1af2df305bc2b7184288a969e537ed64b925caf169f2d820bd678b75")}');
replace_in_file($path_to_file."/src/chainparams.cpp","{ 33333,","//{ 33333,");
replace_in_file($path_to_file."/src/chainparams.cpp","{ 74000,","//{ 74000,");
replace_in_file($path_to_file."/src/chainparams.cpp","{105000,","//{ 105000,");
replace_in_file($path_to_file."/src/chainparams.cpp","{134444,","//{ 134444,");
replace_in_file($path_to_file."/src/chainparams.cpp","{168000,","//{ 168000,");
replace_in_file($path_to_file."/src/chainparams.cpp","{193000,","//{ 193000,");
replace_in_file($path_to_file."/src/chainparams.cpp","{210000,","//{ 210000,");
replace_in_file($path_to_file."/src/chainparams.cpp","{216116,","//{ 216116,");
replace_in_file($path_to_file."/src/chainparams.cpp","{225430,","//{ 225430,");
replace_in_file($path_to_file."/src/chainparams.cpp","{250000,","//{ 250000,");
replace_in_file($path_to_file."/src/chainparams.cpp","{279000,","//{ 279000,");
replace_in_file($path_to_file."/src/chainparams.cpp","{295000,","//{ 295000,");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP34Height = 227931","BIP34Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP65Height = 388381","BIP65Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP66Height = 363725","BIP65Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP34Height = 21111","BIP34Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP65Height = 581885","BIP65Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP66Height = 330776","BIP65Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP34Height = 100000000","BIP34Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP65Height = 1351","BIP65Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","BIP66Height = 1251","BIP65Height = 0; // optimization starting from 0");
replace_in_file($path_to_file."/src/chainparams.cpp","0x0000000000000000000000000000000000000000028822fef1c230963535a90d","0x1d00fff0"); 
replace_in_file($path_to_file."/src/chainparams.cpp","nPowTargetSpacing = 10 * 60","nPowTargetSpacing = 10 * 60"); // change block time (10 min)
replace_in_file($path_to_file."/src/chainparams.cpp","nPowTargetTimespan = 14 * 24 * 60 * 60;","nPowTargetTimespan = 14 * 24 * 60 * 60;"); // Change the difficulty adjustment interval (2 weeks)
replace_in_file($path_to_file."/src/chainparams.cpp","04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f","04381abc5d5f369e088f72036f3ab76fce4e16c6262217d3fb5cf314ef1b39ca09bfcf878ef7742f3f97c6a6356457685ac39eb99ce8b359644a0af7a9554a7980"); // change the genesis public key
replace_in_file($path_to_file."/src/chainparams.cpp","0x4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b","0x26cb14ab1af2df305bc2b7184288a969e537ed64b925caf169f2d820bd678b75"); // byte swapped Merkkle hash
replace_in_file($path_to_file."/src/chainparams.cpp","0x000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f","0x000000003d87575017affb1c3358f0c2286bdba8b8d27cb9ff87b241c744bcac"); // hash
replace_in_file($path_to_file."/src/chainparams.cpp","0x4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b","0x26cb14ab1af2df305bc2b7184288a969e537ed64b925caf169f2d820bd678b75"); // byte swapped Merkkle hash
replace_in_file($path_to_file."/src/chainparams.cpp","0x000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f","0x000000003d87575017affb1c3358f0c2286bdba8b8d27cb9ff87b241c744bcac"); // hash
replace_in_file($path_to_file."/src/chainparams.cpp","0x4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b","0x26cb14ab1af2df305bc2b7184288a969e537ed64b925caf169f2d820bd678b75"); // byte swapped Merkkle hash
replace_in_file($path_to_file."/src/chainparams.cpp","0x000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f","0x000000003d87575017affb1c3358f0c2286bdba8b8d27cb9ff87b241c744bcac"); // hash
replace_in_file($path_to_file."/src/chainparams.cpp","0x0000000000000000002e63058c023a9a1de233554f28c7b21380b6c9003f36a8","0x10000"); //below that chain is valid 

replace_in_file($path_to_file."/src/chainparams.cpp","/**
 * Main network",'
 /**
 Mining algorithm
 */
 const arith_uint256 maxUint = UintToArith256(uint256S("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"));
 static void MineGenesis(CBlockHeader& genesisBlock, const uint256& powLimit, bool noProduction)
{
    if(noProduction)  genesisBlock.nTime = std::time(0);
    genesisBlock.nNonce = 0;

    printf("NOTE: Genesis nTime = %u \n", genesisBlock.nTime);
    printf("WARN: Genesis nNonce (BLANK!) = %u \n", genesisBlock.nNonce);

    arith_uint256 besthash;
    memset(&besthash,0xFF,32);
    arith_uint256 hashTarget = UintToArith256(powLimit);
    printf("Target: %s\n", hashTarget.GetHex().c_str());
    arith_uint256 newhash = UintToArith256(genesisBlock.GetHash());
    while (newhash > hashTarget) {
        genesisBlock.nNonce++;
        if (genesisBlock.nNonce == 0) {
            printf("NONCE WRAPPED, incrementing time\n");
            ++genesisBlock.nTime;
        }
        // If nothing found after trying for a while, print status
        if ((genesisBlock.nNonce & 0xffff) == 0)
            printf("nonce %08X: hash = %s \n(target = %s)\n",
                   genesisBlock.nNonce, newhash.ToString().c_str(),
                   hashTarget.ToString().c_str());

        if(newhash < besthash) {
            besthash = newhash;
            printf("New best: %s\n", newhash.GetHex().c_str());
        }
        newhash = UintToArith256(genesisBlock.GetHash());
    }
    printf("Genesis nTime = %u \n", genesisBlock.nTime);
    printf("Genesis nNonce = %u \n", genesisBlock.nNonce);
    printf("Genesis nBits: %08x\n", genesisBlock.nBits);
    printf("Genesis Hash = %s\n", newhash.ToString().c_str());
    printf("Genesis Hash Merkle Root = %s\n", genesisBlock.hashMerkleRoot.ToString().c_str());
	printf("Genesis Hash Merkle Root = %s\n", genesisBlock.hashMerkleRoot.ToString().c_str());
}

/**
 * Main network');

replace_in_file($path_to_file."/src/chainparams.cpp","consensus.hashGenesisBlock = genesis.GetHash();",'consensus.hashGenesisBlock = genesis.GetHash();
        MineGenesis(genesis, consensus.powLimit, true); // true= start at time(0)
'); 

 
replace_in_file($path_to_file."/src/chainparamsbase.cpp","8332","1790"); // change RPC port value
replace_in_file($path_to_file."/amount.h","21000000","1000000000000"); // change the max money that can  be spend in 1 transaction 
replace_in_file($path_to_file."/src/consensus/consensus.h","COINBASE_MATURITY = 100","COINBASE_MATURITY = 1"); // change the number of confirmations to a low number for starting - change to a higher value later

// validation host the rewards 
//replace_in_file($path_to_file."/src/validation.cpp","(1 << 10) * COIN","(1 << 10) * COIN");
replace_in_file($path_to_file."/src/validation.cpp","// Subsidy is cut in half every 210,000 blocks which will occur approximately every 4 years.","// Kryptofranc specific");



// halving algo for Kryptofranc
replace_in_file($path_to_file."/src/validation.cpp","CAmount GetBlockSubsidy(int nHeight, const Consensus::Params& consensusParams)
{
    int halvings = nHeight / consensusParams.nSubsidyHalvingInterval;
    // Force block reward to zero when right shift is undefined.
    if (halvings >= 64)
        return 0;

    CAmount nSubsidy = 50 * COIN;
    // Kryptofranc specific
    
	if (halvings<=1.0) halvings=1.0;
	nSubsidy =   nSubsidy / halvings;

    return nSubsidy;
}","CAmount GetBlockSubsidy(int nHeight, const Consensus::Params& consensusParams)
{
    CAmount nSubsidy=0;
	double halvings = nHeight / consensusParams.nSubsidyHalvingInterval; // no need to be an int with new algo
	
	if(nHeight <= 50)  
	{
		CAmount nSubsidy = 1000000000 * COIN;  // premine 50 billions on 3rd ->300 blocks
		halvings=1.0;
	}else {
		CAmount nSubsidy = 28028 * COIN; // after premine, 
		int years = (int) nHeight/52560; 
		halvings = (years/1.618033988750);
	}

	if (halvings<=1.0) halvings=1.0;
	nSubsidy =   nSubsidy / halvings;

    return nSubsidy;
}
");

replace_in_file($path_to_file."/Makefile.qt.include","bitcoin.png","kryptofranc.png");
replace_in_file($path_to_file."/Makefile.qt.include","bitcoin.ico","kryptofranc.ico");
replace_in_file($path_to_file."/Makefile.qt.include","bitcoin_testnet.ico","kryptofranc_testnet.ico");

replace_in_file($path_to_file."/src/qt/bitcoin.qrc","res/icons/bitcoin.png","res/icons/kryptofranc.png");
replace_in_file($path_to_file."/src/qt/bitcoin.qrc",'"bitcoin"','"kryptofranc"');


// change the names of the executables as well as the Bitcoin Core weird strings.
replace_in_file($path_to_file."/configure.ac","[Bitcoin Core]","[Kryptofranc Core]");
replace_in_file($path_to_file."/configure.ac","[https://github.com/bitcoin/bitcoin/issues],[bitcoin],[https://bitcoincore.org/])","[https://github.com/kryptofranc/kryptofranc/issues],[kryptofranc],[https://kryptofranc.org/])");

unlink($path_to_file."/qt/res/icons/bitcoin.ico");
unlink($path_to_file."/qt/res/icons/bitcoin.png");
unlink($path_to_file."/qt/res/icons/bitcoin.icns");
unlink($path_to_file."/qt/res/icons/bitcoin_testnet.ico");
unlink($path_to_file."/qt/res/icons/about.png");
copy("kryptofranc.ico",$path_to_file."/src/qt/res/icons/kryptofranc.ico") or die("error copy kryptofranc.ico");
copy("kryptofranc.ico",$path_to_file."/src/qt/res/icons/bitcoin.ico") or die("error copy bitcoin.ico");
copy("kryptofranc.png",$path_to_file."/src/qt/res/icons/kryptofranc.png") or die("error copy kryptofranc.png");
copy("kryptofranc.png",$path_to_file."/src/qt/res/icons/bitcoin.png") or die("error copy bitcoin.png");
copy("kryptofranc.icns",$path_to_file."/src/qt/res/icons/kryptofranc.icns") or die("error copy kryptofranc.icns");
copy("kryptofranc.icns",$path_to_file."/src/qt/res/icons/bitcoin.icns") or die("error copy bitcoin.icns");
copy("kryptofranc_testnet.ico",$path_to_file."/src/qt/res/icons/kryptofranc_testnet.ico") or die("error copy kryptofranc_testnet.ico");;
copy("about.png",$path_to_file."/src/qt/res/icons/about.png") or die("error copy about.png");;
copy("kryptofranc_logo_doxygen.png",$path_to_file."/doc/kryptofranc_logo_doxygen.png") or die("error copy kryptofranc_logo_doxygen.png");
copy("kryptofranc_logo_doxygen.png",$path_to_file."/doc/bitcoin_logo_doxygen.png") or die("error copy kryptofranc_logo_doxygen.png 2");

replace_in_file($path_to_file."/doc/Doxyfile.in","Bitcoin","Kryptofranc");

replace_in_file($path_to_file."/src/qt/bitcoin.cpp","BitcoinGUI::tr(","kryptoFrancGUI::tr(");
replace_in_file($path_to_file."/src/qt/bitcoingui.cpp","arg(BitcoinUnits::","arg(kryptoFrancUnits::");
replace_in_file($path_to_file."/src/qt/receiverequestdialog.cpp","BitcoinUnits::formatHtmlWithUnit","kryptoFrancUnits::formatHtmlWithUnit");
replace_in_file($path_to_file."/src/qt/receiverequestdialog.cpp","BitcoinUnits::","kryptoFrancUnits::");
replace_in_file($path_to_file."/src/qt/sendcoinsdialog.cpp","BitcoinUnits::","kryptoFrancUnits::");
replace_in_file($path_to_file."/src/qt/transactiondesc.cpp","BitcoinUnits::","kryptoFrancUnits::");
replace_in_file($path_to_file."/src/qt/transactiontablemodel.cpp","BitcoinUnits::","kryptoFrancUnits::");
replace_in_file($path_to_file."/src/qt/recentrequeststablemodel.cpp","BitcoinUnits::","kryptoFrancUnits::");



foreach ($cdir as $key => $value) 
{ 
	$nbr=0;$nbrfiles++;
	if (!in_array($value,array(".",".."))) 
	{ 
		if (!is_dir($dir . DIRECTORY_SEPARATOR . $value) && strpos($value,".tmp")===false && (strpos($value,".md")!==false  || strpos($value,".1")!==false || strpos($value,".rc")!==false || strpos($value,".ui")!==false || strpos($value,".h")!==false || strpos($value,".cpp")!==false)) 
		{ 
			$result = $value; 
			echo "Renaming ".$result."...\r\n";

		
			$reading = fopen($result, 'r');
			$writing = fopen($result.'.tmp', 'w');
		
			$replaced = false;

			while (!feof($reading)) {
				$line = fgets($reading);
				
				
				$line=str_replace("Copyright (c) 2009-2018 The Bitcoin Core developers", "Copyright (c) 2009-2018 The Bitcoin Core developers\r\n// Copyright (c) 2018 The Kryptofranc Core developers",$line);
											
				if ( strpos($line,"Q_INIT_RESOURCE")===false && stripos($line,"Copyright")===false && stripos($line,"</header>")===false && stripos($line,"translate")===false && stripos($line,"include")===false && (stripos($line,"bitcoin")!==false || strpos($line,"BTC")!==false ) && strpos($line,"")===false && $line<>false){
					
					//if (stripos($line,"TRANSLATE_NOOP")!==false && stripos($line,"Bitcoin Core")!==false) {
					//	$line=str_replace("Bitcoin Core", "KryptoFranc",$line);
					//	
					//}else{
							
						//$line=str_replace("The Bitcoin Core developers", "xxxxxx",$line);
						//$line=str_replace( "xxxxxx","The Bitcoin Core developers",$line);
						$line=str_replace("bitcoin-core", strtolower($name)."-core",$line);
						$line=str_replace("Bitcoin Core", ucwords($name),$line);
						$line=str_replace("bitcoin", strtolower($name),$line);
						$line=str_replace("bitCoin", $name,$line);
						$line=str_replace("BitCoin", ucwords($name),$line);
						$line=str_replace("Bitcoin", lcfirst($name),$line);
						$line=str_replace("BITCOIN", strtoupper($name),$line);	
						$line=str_replace("BTC", "KYF",$line);
						$line=str_replace("your kryptofrancs from being stolen by malware infecting your computer", "your bitcoins from being stolen by malware infecting your computer",$line);						
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
