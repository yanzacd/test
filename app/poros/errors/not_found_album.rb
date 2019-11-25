module Errors
  class NotFoundAlbum
    def execute(id)
      {
        error: I18n.t('album.not_found', id: id)
      }
    end
  end
end
