class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(user)
    current_user
  end

  helper_method :current_or_guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
  rescue ActiveRecord::RecordNotFound
     session[:guest_user_id] = nil
     guest_user
  end


  private

  def logging_in
=begin currently not letting guests create blogs and posts
    guest_blogs = guest_user.blogs.all
    guest_blogs.each do |blog|
      blog.user_id = current_user.id
      blog.save!
    end

    guest_posts = guest_user.posts.all
    guest_posts.each do |post|
      post.used_id = current_user.id
      post.save!
    end
=end
    guest_comments = guest_user.comments.all
    guest_comments.each do |comment|
      comment.user_id = current_user.id
      comment.save!
    end
  end

  def create_guest_user
    u = User.create(:username => "guest #{Time.now.to_i}#{rand(99)}", :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end
end
