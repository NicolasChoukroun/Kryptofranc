# KryptoFranc "The Popular"

Build:
```
git clone https://github.com/NicolasChoukroun/Kryptofranc
---------------------------
Unix: 
chmod -R 777 KryptoFranc
cd KryptoFranc
./maker.sh unix install
./maker.sh unix all
# then you can compile doing only
./maker.sh unix

-------------------------
Windows (using windows ubuntu subsystem):
chmod -R 777 KryptoFranc
cd KryptoFranc
./maker.sh win64 install
./maker.sh win64 all
# then you can compile doing only
./maker.sh win64

-------------------------
MAC:
chmod -R 777 KryptoFranc
cd KryptoFranc
./maker.sh osx install
./maker.sh osx all
# then you can compile doing only
./maker.sh osx

-------------------------
Deploy
./maker.sh win64 deploy
or
./maker.sh osx deploy
```

Generate keys:
```
PRIVATE_KEY="privatekey.txt"
PUBLIC_KEY="publickey.txt"
KYF_PRIVATE_KEY="kyfprivatekey.txt"
KYF_PUBLIC_KEY="kyfpublickey.txt"
echo "Generating private key"
openssl ecparam -genkey -name secp256k1 -rand /dev/urandom -out $PRIVATE_KEY
echo "Generating public key"
openssl ec -in $PRIVATE_KEY -pubout -out $PUBLIC_KEY
echo "Generating Kryptofranc private key"
openssl ec -in $PRIVATE_KEY -outform DER|tail -c +8|head -c 32|xxd -p -c 32 > $KYF_PRIVATE_KEY
echo "Generating Kryptofranc public key"
openssl ec -in $PRIVATE_KEY -pubout -outform DER|tail -c 65|xxd -p -c 65 > $KYF_PUBLIC_KEY
```


In call cases, the files are in the /binaries/ directory

## English - KryptoFranc: The crypto that gives and keeps on giving

from http://KryptoFranc.com/whitepapers.php

The KryptoFranc is a new altcoin, which purpose is to support organizations and individuals who defend human and citizen rights all over the world. Beyond this general mission, we consider that human rights now include the right to a clean and sustainable environment on a planet protected from the damages of wild carbon emissions.
Today, the conditions in which charities raise funds seem less and less efficient, with ever increasing marketing costs for profits that, although they grow in absolute value, frequently deteriorate in terms of the relationship between collected and distributed funds.
The ambition of the KryptoFranc is to bring new fundraising solutions for NGOs or individuals through the creation of a large community of voters who will select the cause(s) that will receive a significant part of our money supply every fortnight.
The voting process will happen online via traditional web channels. Organizations and individuals who wish to apply for a donation will also have to do it online. Every fortnight, the KryptoFranc community will decide on a donation to a defender or a cause that support human rights, freedom and preservation of the Earth.
The KryptoFranc already disposes of 3,2 billions premined KYF, among which 2 billions KYFwill be distributed in over a period of 10 years as free donations to causes we support.
We believe that freedom in all its form has to be defended when and how the community decides it. In addition to voting, members of the community will be able to support causes that already received KryptoFrancs by buying the currency on the open market via the various exchange platforms on which it will be available.
In that regard, we will create a dedicated exchange platform for charities to use and monetize their KryptoFrancs. This exchange platform will not be exclusive but will ensure the initial solvency of the currency.
We count on this leverage tool to channel large financial flows in favor of freedom in the coming years.
We believe that the KryptoFranc initiative can spark interest among a large audience for the following reasons: The very large audience of donors. In industrialized countries, nearly 60% of the adult population donates to charities every year.
The growing number of organizations in need of funding. The United States alone is home to more than 1,2 millions charities. These organizations collect over 400 billion dollars every year. The phenomenon has now spread all over the world and Africa has become the continent with the fastest growth of charitable donations. In this environment, we believe that the KryptoFranc can become a reference altcoin for charities –several millions structures worldwideas well as donors –several hundreds millions of individuals. We are looking to initiate a virtuous circle in which donations will attract more donations and sustain the growth rate of the currency. This growth will attract investors and speculators who will replenish our initial donations. 

## French - KryptoFranc: La crypto qui donne et donne envie de donner

from http://KryptoFranc.com/whitepapers.php

Le KryptoFranc est un nouvel altcoin dont l’objet est de soutenir les organisations et les individus qui défendent les droits de l’homme et du citoyen à travers le monde. Au delà de ce thème principal, nous considérons que les droits de l’homme inclus désormais le droit à un environnement propre et durable sur planète protégée des dégâts d’un développement carboné non contrôlé. Aujourd’hui, les conditions dans lesquelles les organisations charitables lèvent des fonds semblent de moins en moins efficaces avec des coûts de marketing toujours plus importants pour des rendements qui, si ils progressent en valeur absolue, voient le rapport entre fonds collectés et fonds distribués se détériorer régulièrement. Le KryptoFranc entend rénover l’organisation de la collecte des dons à des ONG ou à des individus à travers la mise en place d’une large communauté de votants qui décident tous les quinze jours à quelle cause attribuer une allocation significative de notre masse monétaire. Le processus de vote se réalise en ligne par des moyens web traditionnels.Les organisations ou les individus qui souhaitent candidater à une donation peuvent le faire par le même moyen. Tous les quinze jours, la communauté du KryptoFranc vote pour attribuer une donation à un défenseur ou à une cause qui font progresser les droits de l’homme, l’égalité, la liberté et la protection de la planète. Dès son avènement, le KryptoFranc dispose d’une masse de 3,2 milliards de KYF dont 2 milliards seront distribués sous forme de dons gratuits aux causes soutenues au cours des années qui viennent. Nous pensons que toutes les formes de liberté doivent être défendues dès lors que les membres de notre communauté le décident. Les membres de la communauté qui le souhaitent pourront soutenir, au delà de leurs votes, les causes disposant de KryptoFranc en achetant la monnaie sur le marché ouvert avec travers les différents échanges sur lesquels elle sera présente.
Dans ce cadre, nous mettrons à la disposition des organisations caritatives un échange dédié qu’elles pourront utiliser pour monétiser
leurs Kryptofrancs. Cet échange ne sera pas exclusif mais permettra d’assurer une liquidité initiale à la monnaie. Nous comptons sur cet effet de levier pour organiser de larges flux financiers en faveur de la cause de la liberté au cours des années qui viennent.
Nous pensons que l’initiative « KryptoFranc » est susceptible de susciter l’intérêt d’un large public. Le public des donateurs est très important : dans les pays industrialisés, près de 60% de la population adulte donne chaque année de l’argent à des organisations caritatives.
Les organisations cherchant à recueillir des dons est en progression constante. Pour les seuls Etats-Unis, le nombre d’organisations caritatives est supérieur à 1,2 Million. Les fonds recueillis par ces organisations chaque année dépassent les 400 milliards de dollars. Le phénomène est désormais mondial et l’Afrique est devenue le continent sur lequel les donations caritatives se développent le plus rapidement. Dans cette configuration, nous pensons que le KryptoFranc peut devenir un altcoin de référence tant pour les organisations-plusieurs millions d’entités à travers le monde-que pour les donateurs-plusieurs centaines de millions d’individus concernés. Nous entendons ainsi créer un cercle vertueux dans lequel les dons appellent les dons qui assurent une croissance au cours de la monnaie,
croissance qui attire investisseurs et spéculateurs qui abondent ainsi la valeur de nos dons initiaux.

## License
KryptoFranc Core is released under the terms of the MIT license. See COPYING for more information or see https://opensource.org/licenses/MIT.
