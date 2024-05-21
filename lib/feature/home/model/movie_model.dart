class Movie {
  final String title;
  final String assetImage;
  final String type;
  final String duration;
  final String rating;
  final String synopsis;
  final bool isPlaying;

  Movie({
    required this.title,
    required this.assetImage,
    required this.type,
    required this.duration,
    required this.rating,
    required this.synopsis,
    required this.isPlaying,
  });
}

final nowPlayingMovie = [
  Movie(
    title: "Godzilla vs. Kong 2",
    assetImage: "assets/godzila.jpeg",
    type: "Action",
    duration: "1h 27m",
    rating: "7.7/10",
    synopsis:
        "Two ancient titans, Godzilla and Kong, clash in an epic battle as humans unravel their intertwined origins and connection to Skull Island's mysteries.",
    isPlaying: true,
  ),
  Movie(
    title: "Kung Fu Panda 4",
    assetImage: "assets/kungfu.jpeg",
    type: "Animmation",
    duration: "1h 34m",
    rating: "7.0/10",
    synopsis:
        "After Po is tapped to become the Spiritual Leader of the Valley of Peace, he needs to find and train a new Dragon Warrior, while a wicked sorceress plans to re-summon all the master villains whom Po has vanquished to the spirit realm.",
    isPlaying: true,
  ),
  Movie(
    title: "Crew",
    assetImage: "assets/crew.jpeg",
    type: "Comedy",
    duration: "2h 29m",
    rating: "8.0/10",
    synopsis:
        "Follows three hard-working women as their destinies lead to some unwarranted situations and they end up caught in a web of lies.",
    isPlaying: true,
  ),
];

final upcoming = [
  Movie(
    title: "Furiosa: A Mad Max Saga",
    assetImage: "assets/madmax.jpeg",
    type: "Action",
    duration: "2h 6m",
    rating: "N/A",
    synopsis:
        "The origin story of renegade warrior Furiosa before her encounter and teamup with Mad Max.",
    isPlaying: false,
  ),
  Movie(
    title: "Toofan",
    assetImage: "assets/toofan.jpeg",
    type: "Action",
    duration: "2h 11m",
    rating: "N/A",
    synopsis:
        "Follows a born killer who rises to power and becomes the biggest don.",
    isPlaying: false,
  ),
  Movie(
    title: "The Fall Guy",
    assetImage: "assets/fallguy.jpeg",
    type: "Action",
    duration: "1h 46m",
    rating: "N/A",
    synopsis:
        "A down-and-out stuntman must find the missing star of his ex-girlfriend's blockbuster film.",
    isPlaying: false,
  ),
];
