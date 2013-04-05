class Vote < ActiveRecord::Base

  scope :for_voter, lambda { |*args| where(["voter_id = ? AND voter_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :for_voteable, lambda { |*args| where(["voteable_id = ? AND voteable_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :recent, lambda { |*args| where(["created_at > ?", (args.first || 2.weeks.ago)]) }
  scope :descending, order("created_at DESC")

  belongs_to :voteable, :polymorphic => true
  belongs_to :voter, :polymorphic => true

  attr_accessible :vote, :voter, :voteable

  # Comment out the line below to allow multiple votes per user.
  validates_uniqueness_of :voteable_id, :scope => [:voteable_type, :voter_type, :voter_id]

  # validate :one_vote_per_category #TODO per city

  # def one_vote_per_category
    # current_category_id = PlaceCategory.find(self.voteable_id).category_id
  #   if current_user's array of categories it voted on includes? current_category_id
  # end
  # def self.vote_total(category_id)
  #   sum=0
  #   PlaceCategory.where(category_id: category_id).each do |place_category|
  #     sum+=place_category.votes.size
  #   end
  # end

end
