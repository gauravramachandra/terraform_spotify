resource "spotify_playlist" "Bollywood" {
    name = "Bollywood"
    tracks = ["6LpswW9691XT9OjVSvDU6G"]
}

data "spotify_search_track" "arijit" {
    artist = "Arijit Singh"
}

resource "spotify_playlist" "slimShady" {
    name = "Slim Shady"
    tracks = [data.spotify_search_track.arijit.tracks[0].id,
             data.spotify_search_track.arijit.tracks[1].id,
             data.spotify_search_track.arijit.tracks[2].id]
}

# Search for tracks from different artists
data "spotify_search_track" "jubin" {
    artist = "Jubin Nautiyal"
}

data "spotify_search_track" "neha" {
    artist = "Neha Kakkar"
}

data "spotify_search_track" "zayn" {
    artist = "Zayn Malik"
}

# Create Terraform Playlist with mixed artists
resource "spotify_playlist" "terraform_playlist" {
    name = "Terraform Playlist"
    tracks = [
        data.spotify_search_track.arijit.tracks[0].id,
        data.spotify_search_track.arijit.tracks[1].id,
        data.spotify_search_track.jubin.tracks[0].id,
        data.spotify_search_track.neha.tracks[0].id,
        data.spotify_search_track.zayn.tracks[0].id
    ]
}