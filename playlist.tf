data "spotify_search_track" "eminem" {
    artist = "Eminem"
    limit = 15
}

resource "spotify_playlist" "slim_shady" {
    name = "Real Slim Shady Playlist"
    tracks = flatten([
    data.spotify_search_track.eminem.tracks[*].id,
  ])
}

data "spotify_search_track" "raghu_dixit" {
    artist = "Raghu Dixit"
    limit = 15
}

resource "spotify_playlist" "raghu_dixit" {
    name = "The Rockstar"
    tracks = flatten([
    data.spotify_search_track.raghu_dixit.tracks[*].id,
  ])
}

data "spotify_track" "name" {
    url = "https://open.spotify.com/track/1u6vTH5nUSKaSTPJZJC81s"
}

resource "spotify_library" "name" {
    tracks = [
        data.spotify_track.name.id
    ]
}
