class Comment < ActiveRecord::Base
  belongs_to :article
  before_create :jadenFilter

  def jadenFilter
    if self.body == self.body.upcase
      self.body = self.body.downcase.split.map(&:capitalize).join(' ')
    end
  end

end
