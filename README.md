# Wookieleaks
Här är koden för hemsidan [Wookieleaks](https://wookieleaks.org/) som används under Hurry Scurry för att visa dödsstjärnans ritningar.
Koden är inprincip en direkt kopia av Wikieleaks startsida, med vissa delar borttagna/utbytta för att handla om rätt saker.

Detta repo är ett hopkok av flera års klipp och klistrande under tidspress. Därför finns stor potential att uppdatera strukturen på detta repo och rensa bort gammalt skräp.

> OBS!
> Eftersom startsidan har små nyhetsavsnitt på sig som har datum till sig, bör man troligtvis vilja uppdatera dessa datum varje år. Annars kanske man avslöjar att Hurry Scurry varit en het grej sedan flera år tillbaka.

## Vad finns här?
Eftersom syftet med vissa filer i denna mapp är lite oklart, kommer här den information som finns angående de olika sakerna i detta repo.

### Nödvändiga filer
Hemsidan består av två sidor, startsidan och sidan som visar ritningarna. Till detta behövs en del nödvändiga filer:

- `styles.css` - Formatterar båda sidorna på ett snyggt sätt (tagen direkt från wikieleaks och innehåller massa onödiga delar)
- `index.html` - Koden för själva startsidan
- `ritningar/` - En mapp med kod och bilder som enbart används till sidan som visar ritningarna.
- Bilder som behövs på båda sidor

### (fd.) oklara filer
Tyvärr finns en del saker vars historia har försvunnit från mottagningspersonalen.

~~Till att börja med har vi de två spännande relikerna från tidigare år vid namnen `.static` och `.env`. ~~
~~De verkar vara helt tomma, men vem vet, kanske är de jätteviktiga vid bygget av själva hemsidan? Detta borde kollas upp någon gång...~~
`.static` och `.env` är viktiga filer för depedencies som används för att bygga sidan. 

~~Vi har även filen `wookieleaks.html` som är en kopia av `index.html`, typ. Ingen har vågat radera den än, men filen är både ouppdaterad och innehåller en del buggar, så den går inte att använda istället för `index.html`.~~ 
Deleted, om den skulle behövas, reverta tillbaka denna commit. 

## Hur deployar man sidan?
Har du gjort uppdateringar av hemsidan och vill få dem att faktiskt köras? Släng iväg ett mail till datasektionens systemansvariga (d-sys@d.kth.se) och be hen deploya sidan. Fungerade i alla fall 2019.
