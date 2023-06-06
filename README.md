# Wookieleaks
Här är koden för hemsidan [Wookieleaks](https://wookieleaks.org/) som används under Hurry Scurry för att visa dödsstjärnans ritningar.
Koden är inprincip en direkt kopia av Wikieleaks startsida, med vissa delar borttagna/utbytta för att handla om rätt saker.

Detta repo är ett hopkok av flera års klipp och klistrande under tidspress. Därför finns stor potential att uppdatera strukturen på detta repo och rensa bort gammalt skräp.

> OBS!
> ~~Eftersom startsidan har små nyhetsavsnitt på sig som har datum till sig, bör man troligtvis vilja uppdatera dessa datum varje år. Annars kanske man avslöjar att Hurry Scurry varit en het grej sedan flera år tillbaka.~~
> Finns nu ett script som uppdaterar året till nuvarande år. Däremot måste man kanske uppdatera datumet för "Dödsstjänrans ritningar" så det är <= dagens datum. Detta görs i på två ställen: [index.html](index.html) och [ritningar/index.html](ritningar/index.html)

## Vad finns här?
Eftersom syftet med vissa filer i denna mapp är lite oklart, kommer här den information som finns angående de olika sakerna i detta repo.

### Nödvändiga filer
Hemsidan består av två sidor, startsidan och sidan som visar ritningarna. Till detta behövs en del nödvändiga filer:

- `styles.css` - Formatterar båda sidorna på ett snyggt sätt (tagen direkt från [WikiLeaks](https://wikileaks.org/) och innehåller massa onödiga delar)
- `index.html` - Koden för själva startsidan
- `ritningar/` - En mapp med kod och bilder som enbart används till sidan som visar ritningarna.
- Bilder som behövs på båda sidor

### (fd.) oklara filer
Tyvärr finns en del saker vars historia har försvunnit från mottagningspersonalen.

`.static` är en fil för depedencies som används för att bygga sidan. Även om den är tom så fyller de en viktig funktion, troligen. (Ja den fyller en viktig funktion /d-sys 21/22, se nedan) 

Den gamla filen `wookieleaks.html` är borttagen. Om den mot all förmodan skulle behövas, reverta tillbaka denna commit. 

## Hur deployar man sidan?
Har du gjort uppdateringar av hemsidan och vill få dem att faktiskt köras? Släng iväg ett mail till datasektionens systemansvariga (d-sys@datasektionen.se) och be hen deploya sidan. Fungerade i alla fall 2019.

## Instruktioner för att deploya
Skriven av Axel Elmarsson, d-sys 21/22.

Som skrivet ovan, kontakta systemansvarig för att deploya. Dessa instruktioner är till för hen om det behövs.

Tidigare användes ett [annat](https://github.com/florianheinemann/buildpack-nginx.git) buildpaket, dock uppstod problem vid deployment 2021. Därför tog jag bort detta buildpaket och använde herokus standardbuildpaket. `.static`-filen existerar för att dokku ska förstå att hemsidan är en statisk hemsida.

1. Klona repot
1. Kör `git push dokku@sips.datasektionen.se:wookieleaks.org`
1. Stäng av uppgradering av HTTP till HTTPS i Cloudflare, detta behövs för att kunna lägga till certifikat och "ge" sidan HTTPS.
    - Detta görs under SSL/TLS och "Always use HTTPS". Sätt den till `Off` TEMPORÄRT.
1. Anslut till sips (`ssh namn@sips.datasektionen.se`)
1. På sips, kör `dokku letsencrypt:enable wookieleaks.org`
1. Aktivera uppgradering av HTTP till HTTPS igen i Cloudflare.

Detta bör vara allt som behövs göra för att deploya wookieleaks, det fungerade i alla fall 2021. Fråga någon gammal annars...

För att ta ned wookieleaks efter hurry scurryn, kör `dokku apps:destroy wookieleaks.org`

### DNS:en
Jag vet i skrivande stund inte vem det är som sköter DNS:en för wookieleaks. Den pekar i alla fall på sips, och måste därför deployas på sips :/ Antar att det är någon gammal räv som äger DNS:en...
