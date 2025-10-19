module SakesHelper
  def star_rating(rating)
    full_stars = rating.floor
    half_star = (rating - full_stars) >= 0.5
    empty_stars = 5 - full_stars - (half_star ? 1 : 0)

    stars = "★" * full_stars
    stars += "☆" if half_star
    stars += "☆" * empty_stars
    stars
  end
end
