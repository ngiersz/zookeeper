# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Zookeeper.Repo.insert!(%Zookeeper.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Zookeeper.Repo
alias Zookeeper.Zoos.Zoo
alias Zookeeper.Animals.Animal

zoo = Repo.insert!(%Zoo{name: "Nowe Zoo Poznań"})

animal =
  Repo.insert!(%Animal{
    name: "Manul Magellan",
    price_cents: 10000,
    description: "Magellan lubi podrózować i zwiedzac browary.",
    benefits: "Certyfikat, tabliczka w zoo i butelka piwa ze zdjęciem Magellana",
    photo_url: "https://bi.im-g.pl/im/7a/83/18/z25704058II,Manul.jpg",
    zoo_id: zoo.id
  })
