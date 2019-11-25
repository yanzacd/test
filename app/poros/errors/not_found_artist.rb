module Errors
  class NotFoundArtist
    def execute(id)
      {
        error: I18n.t('artist.not_found', id: id)
      }
    end
  end
end
