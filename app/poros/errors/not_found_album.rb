module Errors
  class NotFoundAlbum
    def execute(id)
      {
        SpotifyConstants::DATA => [
          error: I18n.t('album.not_found', id: id)
        ]
      }
    end
  end
end
