module ArticlesHelper

  def display_likes(article)
    votes = article.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 8
    count_likers(votes)
  end

  def likers_of(article)
    votes = article.votes_for.up.by_type(User)
    first_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        first_names.push(link_to voter.first_name, profile_path(voter.first_name), class: 'first-name')
      end
      first_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def liked_article(article)
    return 'glyphicon-heart' if current_user.voted_for? article
    'glyphicon-heart-empty'
  end

  private

  def list_likers(votes)
    first_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        first_names.push(link_to voter.first_name, profile_path(voter.first_name), class: 'first-name')
      end
      first_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
