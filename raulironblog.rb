class Blog
  def initialize
    @posts = []
  end
  def add_post post
    @posts << post
  end
  def create_front_page
    ordered_post = order_posts_by_date
    ordered_post.map do |post|
        post_title = get_customize_title post
       "#{post_title}\n********************\n#{post.content}\n"
     end
  end
  def publish_front_page
    posts_ready = create_front_page
    posts_ready.each{|post| puts post}
  end
  private
  def order_posts_by_date
    @posts.sort_by {|post| post.date}
  end
  def get_customize_title post
    post.sponsored ? "***#{post_title}***" : "#{post_title}"
  end
  
end
class Post
  def initialize title, content, date, sponsored=false
    @title = title
    @content = content
    @date = date
    @sponsored = sponsored
  end
end
p1 = Post.new "title1", "Lorem ipsum", "20161013"
p2 = Post.new "title2", "Lorem ipsum", "20161012", true
p3 = Post.new "title3", "Lorem ipsum", "20161014"
blog = Blog.new
blog.add_post p1
blog.add_post p2
blog.add_post p3

