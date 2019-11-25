module Errors
  class NotFoundSong
    def execute(genre)
      {
        SpotifyConstants::DATA => [
          error: I18n.t('song.not_found', genre: genre)
        ]
      }
    end
  end
end
