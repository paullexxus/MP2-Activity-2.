import 'dart:collection';

// Song Class
class Song {
  // variables for song title, artist, and duration
  String title;
  String artist;
  Duration duration;

  // initialize song objects
  Song(this.title, this.artist, this.duration);

  // Play song method with a message
  void play() {
    print("Playing: $title by $artist");
  }

  @override
  String toString() {
    return "[$title - $artist (${duration.inMinutes}m ${duration.inSeconds % 60}s)]";
  }
}

// Playlist Class
class Playlist {
  // Declare a list to store songs in the playlist
  List<Song> songs = [];

  // Add song to playlist method
  void addSong(Song song) {
    songs.add(song);
  }

  // Remove song from playlist by title method
  void removeSongByTitle(String title) {
    songs.removeWhere((song) => song.title == title);
  }

  // Play all songs in the playlist method
  void playAll() {
    for (Song song in songs) {
      song.play();
    }
  }

  // Display all songs in the playlist with details method
  void displayPlaylist() {
    print("Playlist:");
    for (Song song in songs) {
      print(song);
    }
  }
}

// MusicFestival Class
class MusicFestival {
  // Declare a list to store playlists (stages)
  List<Playlist> stages = [];

  // Add playlist (stage) to the festival method
  void addStage(Playlist playlist) {
    stages.add(playlist);
  }

  // Play a specific stage (playlist) by index method
  void playStage(int index) {
    if (index >= 0 && index < stages.length) {
      stages[index].playAll();
    } else {
      print("Invalid stage index!");
    }
  }

  // Display all stages (playlists) with song details method
  void displaySetList() {
    print("Music Festival Set List:");
    int stageNumber = 1;
    for (Playlist stage in stages) {
      print("Stage $stageNumber:");
      stage.displayPlaylist();
      print("");
      stageNumber++;
    }
  }
}

// Main function to create a music festival and demonstrate functionalities
void main() {
  // Create a MusicFestival object
  MusicFestival musicFestival = MusicFestival();

  // Create some Song objects
  //rock song
  Song song1 = Song("One", "Metallica", Duration(minutes: 7, seconds: 45));
  Song song2 =
      Song("free bird", "Lynyrd Skynyrd", Duration(minutes: 9, seconds: 11));
  Song song3 = Song("Take the power back", "Rage against the machine",
      Duration(minutes: 6, seconds: 05));
  Song song7 =
      Song("Basket Case", "Green Day", Duration(minutes: 3, seconds: 00));
  Song song8 = Song(
      "Smells Like Teen Spirit", "Nirvana", Duration(minutes: 5, seconds: 00));
  Song song4 =
      Song("Agent Orange", "Slapshock", Duration(minutes: 4, seconds: 19));
  //pop song
  Song song5 =
      Song("The scienist", "Coldplay", Duration(minutes: 4, seconds: 26));
  Song song6 =
      Song("More than words", "Extreme", Duration(minutes: 4, seconds: 11));
  //rap
  Song song9 =
      Song("Lose Yourself", "Eminem", Duration(minutes: 5, seconds: 20));
  Song song10 =
      Song("Sing for the moment", "eminem", Duration(minutes: 5, seconds: 26));

  // Create some Playlist objects (Stages)
  Playlist rockStage = Playlist();
  Playlist popStage = Playlist();
  Playlist rapStage = Playlist();

  // Add songs to playlists (stages)
  rockStage.addSong(song1);
  rockStage.addSong(song2);
  rockStage.addSong(song3);
  rockStage.addSong(song4);
  rockStage.addSong(song5);

  popStage.addSong(song6);
  popStage.addSong(song7);
  popStage.addSong(song8);
  popStage.addSong(song9);
  popStage.addSong(song10);

  rapStage.addSong(song1);
  rapStage.addSong(song3);
  rapStage.addSong(song5);
  rapStage.addSong(song7);
  rapStage.addSong(song9);

  // Add playlists (stages) to the music festival
  musicFestival.addStage(rockStage);
  musicFestival.addStage(popStage);
  musicFestival.addStage(rapStage);

  // Display the set list
  musicFestival.displaySetList();

  // Play a specific stage (playlist)
  print("playing music");
  musicFestival.playStage(2);
}
