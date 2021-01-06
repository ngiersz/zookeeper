# Script for populating the database. You can run it as:
#     mix run priv/repo/seeds.exs

alias Zookeeper.Repo
alias Zookeeper.Zoos.Zoo
alias Zookeeper.Animals.Animal

zoo_poznan = Repo.insert!(%Zoo{name: "Nowe Zoo Poznań"})
zoo_new_zealand = Repo.insert!(%Zoo{name: "Zoo Nowa Zelandia"})
zoo_africa = Repo.insert!(%Zoo{name: "Zoo Afryka"})

[
  %Animal{
    name: "Manul Magellan",
    price_cents: 10000,
    description: "Magellan lubi podrózować i zwiedzac browary.",
    benefits: "Certyfikat, tabliczka w zoo i butelka piwa ze zdjęciem Magellana",
    photo_url: "https://bi.im-g.pl/im/7a/83/18/z25704058II,Manul.jpg",
    zoo_id: zoo_poznan.id
  },
  %Animal{
    name: "Kakapo Sirocco",
    price_cents: 50000,
    description:
      "Kakapo to gatunek krytycznie zagrożony wyginięciem. W marcu 2014 znanych było jedynie 125 żyjących osobników[12], z których większość ma nadane imiona. W sezonie 2014 doszło do pierwszego od 2011 roku złożenia jaj przez kakapo[13]. Brak zagrożenia ze strony drapieżnych ssaków spowodował u kakapo zanik zdolności do lotu. Kolonizacja Polinezyjczyków i Europejczyków oraz wprowadzenie lub przywleczenie takich drapieżników jak szczury, koty oraz gronostaje, doprowadziły do przetrzebienia bądź eksterminacji większości kakapo. Działania ochronne zaczęto prowadzić już w latach 90. XIX w., ale nie przynosiły one prawie żadnych rezultatów, aż do czasu wdrożenia planu Kakapo Recovery Plan (z ang. Plan przywrócenia kakapo) w latach 80. XX w. Od kwietnia 2012 ocalałe osobniki kakapo trzymane są na wolnych od drapieżników wyspach: Codfish, Anchor Island i Little Barrier Island, gdzie są monitorowane. Celem Kakapo Recovery Plan jest odtworzenie populacji kakapo na poziomie 150 dojrzałych płciowo samic.

      Papuga kakapo, podobnie jak inne gatunki nowozelandzkich ptaków, była historycznie ważna dla Maorysów, rdzennej ludności Nowej Zelandii, co przejawia się jej obecnością w wielu tradycyjnych legendach i folklorze.",
    benefits: "Certyfikat, tabliczka w zoo i pluszowy kakapo",
    photo_url: "https://i.pinimg.com/originals/84/67/18/846718c017d345a001236d2fa6022529.png",
    zoo_id: zoo_new_zealand.id
  },
  %Animal{
    name: "Sowa Pójdźka",
    price_cents: 10000,
    description:
      "Gatunek średniej wielkości ptaka z rodziny puszczykowatych (Strigidae), zamieszkujący całą Europę poza Półwyspem Skandynawskim i północną Rosją, Afrykę Północną z Saharą, Bliski Wschód i środkową Azję aż po Koreę. Pod koniec XIX wieku reintrodukowana w Wielkiej Brytanii, obecnie również tam jest lęgowa. W Polsce bardzo nieliczny ptak lęgowy (w latach 2008–2012 jej liczebność na terenie kraju szacowano na 500–1000 par[5]), ściśle osiadły. W starożytnej Grecji pójdźka poświęcona była Atenie, bogini mądrości. Pójdźki gnieździły się w załomach murów Akropolu, co miało świadczyć o sympatii bogini dla tych ptaków. Wierzono, że Atena używała ich jako posłańców. Stąd wywodzi się łacińska nazwa rodzaju: Athene, a także znane w wielu kulturach przedstawienie sowy jako symbolu mądrości i wiedzy.
      Dawniej na wsi uważano, że pójdźka przepowiada śmierć, wołając: „pójdź, pójdź w dołek pod kościołek...”. Była nawet z tego powodu zabijana.",
    benefits: "Certyfikat, tabliczka w zoo i okulary, aby wyglądać mądrze jak sowa",
    photo_url: "https://www.tapeciarnia.pl/tapety/normalne/tapeta-pojdzka-na-kamieniu.jpg",
    zoo_id: zoo_poznan.id
  },
  %Animal{
    name: "Lew Leon",
    price_cents: 100_000,
    description:
      "Lew był jednym z pierwszych zwierząt portretowanych przez człowieka. Jego wizerunki można odnaleźć na malowidłach skalnych liczących 15 000 lat (m.in. w jaskini Lascaux). W starożytności zwierzęta te były uosobieniem władzy i potęgi, stąd częste ich przedstawienia jako bóstwa i symbole królów, zwłaszcza w Egipcie (bogowie Sechmet, Dedun, Maahes, rzeźba lwa z głową faraona – Sfinks). Zwierzęta te występowały także w sztuce Babilonu.",
    benefits: "Certyfikat, tabliczka w zoo i szczotka do grzywy",
    photo_url:
      "https://animals.sandiegozoo.org/sites/default/files/2016-09/animals_hero_lions_0.jpg",
    zoo_id: zoo_africa.id
  },
  %Animal{
    name: "Mysikrólik Regulus",
    price_cents: 5000,
    description:
      "Zacznę może od nazwy łacińskiej – Regulus regulus. Systematycy doszukują się jej pochodzenia w innym słowie będącym zdrobnieniem określenia władcy, czyli rex. Rex w swoim tłumaczeniu oznacza małego króla. To tutaj trzeba upatrywać pochodzenia polskiej nazwy tego ptaka. Mysikrólik – mysz jest mała i zwinna, a królik idąc wcześniej podanym tropem, dla podkreślenia powagi gatunku. Czy można mysikrólika uznać za małego króla?

    W moim odczuciu tak! Mieszka wysoko w drzewach tak jak królowie w zamkach wysoko na skale, ma wybredne wymagania co do miejsca na gniazdo – w drzewach liściastych nie zamieszka, a poza tym złota wstęga ciągnąca się od czoła aż do potylicy przypominająca koronę.",
    benefits: "Certyfikat, tabliczka w zoo, budka lęgowa i kapselek jako czapeczka",
    photo_url:
      "https://zasoby.ekologia.pl/artykulyNew/22451/xxl/shutterstock-224828218_800x600.jpg",
    zoo_id: zoo_poznan.id
  },
  %Animal{
    name: "Gołąb Grzywacz Gracjan",
    price_cents: 100,
    description:
      "Columba livia forma urbana - po łacinie brzmi pięknie, ale w polskich realiach gołąb miejski, bo o nim mowa, wielu przyprawia o gęsią skórkę. Znów od świtu hałasują na parapetach, głośno gruchają, ale przede wszystkim szukają miejsca na gniazda, często na balkonach. Czy można temu zaradzić?

    Gołębie, które żyją w mieście pochodzą od gołębia skalnego. Udało im się przystosować do miejskich warunków, gdzie budynki traktują jak skały. Często zakładają gniazda w różnych zadaszonych zakamarkach budynków, ale też na balkonach, gdzie czują się bezpiecznie. I tu pojawia się bardzo poważny problem dla wielu mieszkańców Ursynowa.

    - Strach z domu wyjechać, żeby po powrocie nie zastać gniazda. W tamtym roku, przegapiliśmy moment i zaczął się horror. Dwa młode narobiły takiego bałaganu, że jak się już ich pozbyliśmy, to trzeba było użyć myjki ciśnieniowej, żeby usunąć warstwę odchodów - mówi Tomasz z Ursynowa Północnego.

    Jeden gołąb produkuje rocznie nawet 12 kg odchodów, wielu mieszkańców traktuje te ptaki jak \"latające szczury\", rozmnażające się bez umiaru.

    - Najgorsze, że gołębie niczego się nie boją. Próbowaliśmy wszystkiego. Wieszania woreczków foliowych, płyt kompaktowych. Podobno pomagają sztuczne kruki, których gołębie miały się bać, ale to też nie pomogło. Zostało już tylko zamontowanie siatki, ale to oznacza koszt oraz utrudni posadzenie kwiatów na balkonie - mówi Joanna z Imielina.",
    benefits: "Certyfikat, tabliczka w zoo i stary chleb",
    photo_url: "https://miropress.files.wordpress.com/2011/04/017.jpg?w=660",
    zoo_id: zoo_poznan.id
  }
]
|> Enum.map(&Repo.insert/1)
